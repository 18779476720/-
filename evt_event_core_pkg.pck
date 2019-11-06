CREATE OR REPLACE PACKAGE evt_event_core_pkg IS

  -- Author  : Razgriz
  -- Created : 2009-6-2
  -- Purpose : business event system(modify with evt_core,evt_factory,evt_handle)

  -- handle 返回代码
  c_return_normal         CONSTANT NUMBER := 0;
  c_return_disable_handle CONSTANT NUMBER := -1;

  -- 是否执行成功
  c_evt_return_success CONSTANT NUMBER := 1;
  c_evt_return_error   CONSTANT NUMBER := 0;

  -- handle的类型
  c_handle_type_proc CONSTANT NUMBER := 0;

  /* ================ 设置handle是否成功执行的标记 =================== */
  PROCEDURE set_handle_success(p_log_id  NUMBER,
                               p_success NUMBER);

  /* ================ 记录handle返回的log信息 =================== */
  PROCEDURE set_handle_message(p_log_id NUMBER,
                               p_msg    VARCHAR2);

  /* ================ 创建事件处理过程 =================== */
  PROCEDURE create_event_handle(p_event_name   VARCHAR2,
                                p_order_num    NUMBER,
                                p_proc_name    VARCHAR2,
                                p_handle_title VARCHAR2 DEFAULT NULL,
                                p_handle_desc  VARCHAR2 DEFAULT NULL,
                                p_created_by   NUMBER);

  /* ================ 创建事件记录 =================== */
  /*function create_event_record(p_event_name   varchar2,
  p_event_param  number,
  p_created_by   number,
  p_event_source varchar2) return number;*/

  /* ================ 触发事件 =================== */
  PROCEDURE fire_event(p_event_name   VARCHAR2,
                       p_event_param  NUMBER,
                       p_created_by   NUMBER,
                       p_event_type   VARCHAR2 DEFAULT NULL,
                       p_event_object VARCHAR2 DEFAULT NULL,
                       p_event_source VARCHAR2 DEFAULT NULL,
                       p_param1       VARCHAR2 DEFAULT NULL,
                       p_param2       VARCHAR2 DEFAULT NULL,
                       p_param3       VARCHAR2 DEFAULT NULL,
                       p_param4       VARCHAR2 DEFAULT NULL,
                       p_param5       VARCHAR2 DEFAULT NULL,
                       p_param6       VARCHAR2 DEFAULT NULL,
                       p_param7       VARCHAR2 DEFAULT NULL,
                       p_param8       VARCHAR2 DEFAULT NULL);

  /* ================ 删除事件记录 =================== */
  PROCEDURE destory_event_record(p_event_param  NUMBER,
                                 p_user_id      NUMBER,
                                 p_event_name   VARCHAR2 DEFAULT NULL,
                                 p_event_source VARCHAR2 DEFAULT NULL,
                                 p_event_type   VARCHAR2 DEFAULT NULL,
                                 p_event_object VARCHAR2 DEFAULT NULL,
                                 p_param1       VARCHAR2 DEFAULT NULL,
                                 p_param2       VARCHAR2 DEFAULT NULL,
                                 p_param3       VARCHAR2 DEFAULT NULL,
                                 p_param4       VARCHAR2 DEFAULT NULL,
                                 p_param5       VARCHAR2 DEFAULT NULL,
                                 p_param6       VARCHAR2 DEFAULT NULL,
                                 p_param7       VARCHAR2 DEFAULT NULL,
                                 p_param8       VARCHAR2 DEFAULT NULL);

END evt_event_core_pkg;
/
CREATE OR REPLACE PACKAGE BODY evt_event_core_pkg IS

  when_ora_01002 EXCEPTION;
  PRAGMA EXCEPTION_INIT(when_ora_01002, -01002);

  -- Private Function
  /* ================= 供handle使用的，记录handle返回信息的过程 ================= */
  FUNCTION get_handle_log_id RETURN evt_event_handle_log.record_id%TYPE IS
    v_handle_log_id evt_event_handle_log.record_id%TYPE;
  BEGIN
    SELECT evt_event_handle_log_s.nextval
      INTO v_handle_log_id
      FROM dual;
    RETURN v_handle_log_id;
  END get_handle_log_id;

  FUNCTION get_event_record_id RETURN evt_event_record.record_id%TYPE IS
    v_event_record_id evt_event_record.record_id%TYPE;
  BEGIN
    SELECT evt_event_record_s.nextval
      INTO v_event_record_id
      FROM dual;
    RETURN v_event_record_id;
  END get_event_record_id;

  FUNCTION create_handle_log(p_event_record_id NUMBER,
                             p_handle_type     NUMBER,
                             p_handle_id       NUMBER) RETURN evt_event_handle_log.record_id%TYPE IS
    v_handle_log_id evt_event_handle_log.record_id%TYPE;
  BEGIN
    v_handle_log_id := get_handle_log_id;
  
    INSERT INTO evt_event_handle_log
      (record_id,
       event_record_id,
       handle_type,
       handle_id)
    VALUES
      (v_handle_log_id,
       p_event_record_id,
       p_handle_type,
       p_handle_id);
  
    RETURN v_handle_log_id;
  END create_handle_log;

  -- 创建一个新的事件记录
  FUNCTION create_event_record(p_event_name   VARCHAR2,
                               p_event_param  NUMBER,
                               p_created_by   NUMBER,
                               p_event_type   VARCHAR2 DEFAULT NULL,
                               p_event_object VARCHAR2 DEFAULT NULL,
                               p_event_source VARCHAR2 DEFAULT NULL,
                               p_param1       VARCHAR2 DEFAULT NULL,
                               p_param2       VARCHAR2 DEFAULT NULL,
                               p_param3       VARCHAR2 DEFAULT NULL,
                               p_param4       VARCHAR2 DEFAULT NULL,
                               p_param5       VARCHAR2 DEFAULT NULL,
                               p_param6       VARCHAR2 DEFAULT NULL,
                               p_param7       VARCHAR2 DEFAULT NULL,
                               p_param8       VARCHAR2 DEFAULT NULL) RETURN NUMBER IS
    -- 返回新建记录ID
    v_event_record_id NUMBER;
  BEGIN
    v_event_record_id := get_event_record_id;
  
    INSERT INTO evt_event_record
      (record_id,
       event_name,
       event_type,
       trigger_object,
       event_param,
       event_source,
       param1,
       param2,
       param3,
       param4,
       param5,
       param6,
       param7,
       param8,
       creation_date,
       created_by,
       last_update_date,
       last_updated_by)
    VALUES
      (v_event_record_id,
       p_event_name,
       p_event_type,
       p_event_object,
       p_event_param,
       p_event_source,
       p_param1,
       p_param2,
       p_param3,
       p_param4,
       p_param5,
       p_param6,
       p_param7,
       p_param8,
       SYSDATE,
       p_created_by,
       SYSDATE,
       p_created_by);
  
    RETURN v_event_record_id;
  END create_event_record;

  PROCEDURE create_event_handle(p_handle_record_id NUMBER,
                                p_event_name       VARCHAR2,
                                p_order_num        NUMBER,
                                p_object_name      VARCHAR2,
                                p_event_type       VARCHAR2,
                                p_handle_title     VARCHAR2,
                                p_handle_desc      VARCHAR2,
                                p_proc_name        VARCHAR2,
                                p_handle_type      NUMBER,
                                p_created_by       NUMBER) IS
  BEGIN
    INSERT INTO evt_event_handle
      (handle_record_id,
       event_name,
       order_num,
       object_name,
       event_type,
       handle_title,
       handle_desc,
       proc_name,
       handle_type,
       creation_date,
       created_by,
       last_update_date,
       last_updated_by)
    VALUES
      (p_handle_record_id,
       p_event_name,
       p_order_num,
       p_object_name,
       p_event_type,
       p_handle_title,
       p_handle_desc,
       p_proc_name,
       p_handle_type,
       SYSDATE,
       p_created_by,
       SYSDATE,
       p_created_by);
  END create_event_handle;

  PROCEDURE create_event_handle(p_handle_record_id NUMBER,
                                p_event_name       VARCHAR2,
                                p_order_num        NUMBER,
                                p_proc_name        VARCHAR2,
                                p_handle_type      NUMBER,
                                p_handle_title     VARCHAR2 DEFAULT NULL,
                                p_handle_desc      VARCHAR2 DEFAULT NULL,
                                p_created_by       NUMBER) IS
    v_evt evt_event%ROWTYPE;
  BEGIN
    SELECT *
      INTO v_evt
      FROM evt_event e
     WHERE e.event_name = p_event_name;
  
    create_event_handle(p_handle_record_id, p_event_name, p_order_num, v_evt.object_name, v_evt.event_type, p_handle_title, p_handle_desc, p_proc_name, p_handle_type, p_created_by);
  END create_event_handle;

  PROCEDURE create_event_handle(p_handle_record_id NUMBER,
                                p_event_name       VARCHAR2,
                                p_order_num        NUMBER,
                                p_proc_name        VARCHAR2,
                                p_handle_title     VARCHAR2 DEFAULT NULL,
                                p_handle_desc      VARCHAR2 DEFAULT NULL,
                                p_created_by       NUMBER) IS
  BEGIN
    create_event_handle(p_handle_record_id, p_event_name, p_order_num, p_proc_name, c_handle_type_proc, p_handle_title, p_handle_desc, p_created_by);
  END create_event_handle;

  FUNCTION execute_handle_proc(p_handle_record_id NUMBER,
                               p_handle_log_id    NUMBER,
                               p_event            evt_event_record%ROWTYPE) RETURN NUMBER IS
    v_return    NUMBER;
    v_proc_name evt_event_handle.proc_name%TYPE;
    v_pkg_name  VARCHAR2(30);
    v_fun_name  VARCHAR2(30);
    v_count     NUMBER;
    v_sql       VARCHAR2(4000);
  
    e_proc_not_found EXCEPTION;
  BEGIN
    SELECT upper(p.proc_name)
      INTO v_proc_name
      FROM evt_event_handle p
     WHERE p.handle_record_id = p_handle_record_id;
  
    SELECT substr(v_proc_name, 1, instr(v_proc_name, '.', 1) - 1),
           substr(v_proc_name, instr(v_proc_name, '.', 1) + 1)
      INTO v_pkg_name,
           v_fun_name
      FROM dual;
  
    SELECT COUNT(*)
      INTO v_count
      FROM user_procedures v
     WHERE
    --v.object_type = 'PACKAGE'  and
     v.object_name = v_pkg_name
     AND v.procedure_name = v_fun_name;
  
    IF v_count = 0 THEN
      RAISE e_proc_not_found;
    END IF;
  
    v_sql := 'begin :1 := ' || v_proc_name || '( :2, :3, :4, :5); end;';
  
    EXECUTE IMMEDIATE v_sql
      USING OUT v_return, p_event.record_id, p_handle_log_id, p_event.event_param, p_event.created_by;
  
    RETURN v_return;
  EXCEPTION
    WHEN e_proc_not_found THEN
      set_handle_success(p_handle_log_id, c_evt_return_error);
      set_handle_message(p_handle_log_id, SQLERRM);
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'EVT2010_EVENT_HANDLE_NOT_FOUND',
                                                      p_created_by              => p_event.created_by,
                                                      p_package_name            => 'EVT_EVENT_CORE_PKG',
                                                      p_procedure_function_name => 'EXECUTE_HANDLE_PROC',
                                                      p_token_1                 => '#evt_name',
                                                      p_token_value_1           => p_event.event_name,
                                                      p_token_2                 => '#fun_name',
                                                      p_token_value_2           => v_proc_name);
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
    WHEN OTHERS THEN
      set_handle_success(p_handle_log_id, c_evt_return_error);
      set_handle_message(p_handle_log_id, SQLERRM);
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || SQLERRM,
                                                     p_created_by              => p_event.created_by,
                                                     p_package_name            => 'EVT_EVENT_CORE_PKG',
                                                     p_procedure_function_name => 'EXECUTE_HANDLE_PROC');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END execute_handle_proc;

  PROCEDURE fire_event(p_event_record_id NUMBER) IS
    v_event_record  evt_event_record%ROWTYPE;
    v_handle_log_id NUMBER;
    v_proc_return   NUMBER;
  BEGIN
    BEGIN
      SELECT *
        INTO v_event_record
        FROM evt_event_record e
       WHERE e.record_id = p_event_record_id;
    EXCEPTION
      WHEN no_data_found THEN
        RETURN;
    END;
  
    FOR handle IN (SELECT *
                     FROM evt_event_handle h
                    WHERE h.event_name = v_event_record.event_name
                    ORDER BY h.order_num)
    LOOP
    
      -- 创建handle log记录
      v_handle_log_id := create_handle_log(p_event_record_id => p_event_record_id, p_handle_type => handle.handle_type, p_handle_id => handle.handle_record_id);
    
      -- 根据handle类型调用handle
      IF handle.handle_type = c_handle_type_proc THEN
        v_proc_return := execute_handle_proc(handle.handle_record_id, v_handle_log_id, v_event_record);
        IF v_proc_return = c_return_disable_handle THEN
          RETURN;
        END IF;
      END IF;
    
    END LOOP;
  
  EXCEPTION
    WHEN when_ora_01002 THEN
      NULL;
  END fire_event;

  -- 设置handle是否成功执行的标记
  PROCEDURE set_handle_success(p_log_id  NUMBER,
                               p_success NUMBER) IS
  BEGIN
    UPDATE evt_event_handle_log l
       SET l.success_flag = p_success
     WHERE l.record_id = p_log_id;
  END;

  -- 记录handle返回的log信息
  PROCEDURE set_handle_message(p_log_id NUMBER,
                               p_msg    VARCHAR2) IS
  BEGIN
    UPDATE evt_event_handle_log l
       SET l.log_message = p_msg
     WHERE l.record_id = p_log_id;
  END;

  /* ================ 创建事件处理过程 =================== */
  PROCEDURE create_event_handle(p_event_name   VARCHAR2,
                                p_order_num    NUMBER,
                                p_proc_name    VARCHAR2,
                                p_handle_title VARCHAR2 DEFAULT NULL,
                                p_handle_desc  VARCHAR2 DEFAULT NULL,
                                p_created_by   NUMBER) IS
    v_handle_record_id NUMBER;
  BEGIN
    SELECT evt_event_handle_s.nextval
      INTO v_handle_record_id
      FROM dual;
  
    create_event_handle(v_handle_record_id, p_event_name, p_order_num, p_proc_name, p_handle_title, p_handle_desc, p_created_by);
  END create_event_handle;

  /* ================ 创建事件记录 =================== */
  /*function create_event_record(p_event_name   varchar2,
                               p_event_param  number,
                               p_created_by   number,
                               p_event_type   varchar2 default null,
                               p_event_object varchar2 default null,
                               p_event_source varchar2 default null,
                               p_param1       varchar2 default null,
                               p_param2       varchar2 default null,
                               p_param3       varchar2 default null,
                               p_param4       varchar2 default null,
                               p_param5       varchar2 default null,
                               p_param6       varchar2 default null,
                               p_param7       varchar2 default null,
                               p_param8       varchar2 default null)
    return number is
    v_event_type      varchar2(200);
    v_event_object    varchar2(200);
    v_event_record_id number;
  begin
    begin
      select e.event_type, e.object_name
        into v_event_type, v_object
        from evt_event e
       where e.event_name = p_event_name;
    exception
      when others then
        null;
    end;
  
    v_event_record_id := create_event_record(p_event_name,
                                             v_event_type,
                                             v_event_object,
                                             p_event_param,
                                             p_event_source,
                                             p_created_by);
  
    return v_event_record_id;
  
  end create_event_record;*/

  /* ================ 触发事件 =================== */
  PROCEDURE fire_event(p_event_name   VARCHAR2,
                       p_event_param  NUMBER,
                       p_created_by   NUMBER,
                       p_event_type   VARCHAR2 DEFAULT NULL,
                       p_event_object VARCHAR2 DEFAULT NULL,
                       p_event_source VARCHAR2 DEFAULT NULL,
                       p_param1       VARCHAR2 DEFAULT NULL,
                       p_param2       VARCHAR2 DEFAULT NULL,
                       p_param3       VARCHAR2 DEFAULT NULL,
                       p_param4       VARCHAR2 DEFAULT NULL,
                       p_param5       VARCHAR2 DEFAULT NULL,
                       p_param6       VARCHAR2 DEFAULT NULL,
                       p_param7       VARCHAR2 DEFAULT NULL,
                       p_param8       VARCHAR2 DEFAULT NULL) IS
  BEGIN
    fire_event(create_event_record(p_event_name,
                                   p_event_param,
                                   p_created_by,
                                   p_event_type,
                                   p_event_object,
                                   p_event_source,
                                   p_param1,
                                   p_param2,
                                   p_param3,
                                   p_param4,
                                   p_param5,
                                   p_param6,
                                   p_param7,
                                   p_param8));
  END fire_event;

  PROCEDURE destory_event_record(p_event_param  NUMBER,
                                 p_user_id      NUMBER,
                                 p_event_name   VARCHAR2 DEFAULT NULL,
                                 p_event_source VARCHAR2 DEFAULT NULL,
                                 p_event_type   VARCHAR2 DEFAULT NULL,
                                 p_event_object VARCHAR2 DEFAULT NULL,
                                 p_param1       VARCHAR2 DEFAULT NULL,
                                 p_param2       VARCHAR2 DEFAULT NULL,
                                 p_param3       VARCHAR2 DEFAULT NULL,
                                 p_param4       VARCHAR2 DEFAULT NULL,
                                 p_param5       VARCHAR2 DEFAULT NULL,
                                 p_param6       VARCHAR2 DEFAULT NULL,
                                 p_param7       VARCHAR2 DEFAULT NULL,
                                 p_param8       VARCHAR2 DEFAULT NULL) IS
    v_sql VARCHAR2(10000);
  BEGIN
    v_sql := 'delete from evt_event_record where event_param = ' || p_event_param;
  
    IF p_event_name IS NOT NULL THEN
      v_sql := v_sql || ' and event_name = ''' || p_event_name || '''';
    END IF;
  
    IF p_event_source IS NOT NULL THEN
      v_sql := v_sql || ' and event_source = ''' || p_event_source || '''';
    END IF;
  
    IF p_event_type IS NOT NULL THEN
      v_sql := v_sql || ' and event_type = ''' || p_event_type || '''';
    END IF;
  
    IF p_event_object IS NOT NULL THEN
      v_sql := v_sql || ' and trigger_object = ''' || p_event_object || '''';
    END IF;
  
    IF p_param1 IS NOT NULL THEN
      v_sql := v_sql || ' and param1 = ''' || p_param1 || '''';
    END IF;
  
    IF p_param2 IS NOT NULL THEN
      v_sql := v_sql || ' and param2 = ''' || p_param2 || '''';
    END IF;
  
    IF p_param3 IS NOT NULL THEN
      v_sql := v_sql || ' and param3 = ''' || p_param3 || '''';
    END IF;
  
    IF p_param4 IS NOT NULL THEN
      v_sql := v_sql || ' and param4 = ''' || p_param4 || '''';
    END IF;
  
    IF p_param5 IS NOT NULL THEN
      v_sql := v_sql || ' and param5 = ''' || p_param5 || '''';
    END IF;
  
    IF p_param6 IS NOT NULL THEN
      v_sql := v_sql || ' and param6 = ''' || p_param6 || '''';
    END IF;
  
    IF p_param7 IS NOT NULL THEN
      v_sql := v_sql || ' and param7 = ''' || p_param7 || '''';
    END IF;
  
    IF p_param8 IS NOT NULL THEN
      v_sql := v_sql || ' and param8 = ''' || p_param8 || '''';
    END IF;
  
    EXECUTE IMMEDIATE v_sql;
  END destory_event_record;

END evt_event_core_pkg;
/

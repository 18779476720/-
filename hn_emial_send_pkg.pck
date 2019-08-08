CREATE OR REPLACE PACKAGE hn_emial_send_pkg IS

  -- Author  : CHENG-LU
  -- Created : 2018/11/9 9:20:32
  -- Purpose : 汉能消息通知包
  /***
  *准入评估报告发送系统消息
  *
  */
  PROCEDURE hn_admi_score_send(p_message_id        NUMBER,
                               p_event_param       NUMBER,
                               p_recipient_id      NUMBER,
                               p_recipient_type_id NUMBER,
                               p_user_id           NUMBER);
  --现场考察评分通知                            
  PROCEDURE hn_cert_assess_score_send(p_message_id        NUMBER,
                                      p_event_param       NUMBER,
                                      p_recipient_id      NUMBER,
                                      p_recipient_type_id NUMBER,
                                      p_user_id           NUMBER);
  --样件测试通知
  PROCEDURE hn_exemplar_report_send(p_message_id        NUMBER,
                                    p_event_param       NUMBER,
                                    p_recipient_id      NUMBER,
                                    p_recipient_type_id NUMBER,
                                    p_user_id           NUMBER);
  --小批量测试通知
  PROCEDURE hn_small_batch_send(p_message_id        NUMBER,
                                p_event_param       NUMBER,
                                p_recipient_id      NUMBER,
                                p_recipient_type_id NUMBER,
                                p_user_id           NUMBER);

END hn_emial_send_pkg;
/
CREATE OR REPLACE PACKAGE BODY hn_emial_send_pkg IS
  --准入评估下发评分
  PROCEDURE hn_admi_score_send(p_message_id        NUMBER,
                               p_event_param       NUMBER,
                               p_recipient_id      NUMBER,
                               p_recipient_type_id NUMBER,
                               p_user_id           NUMBER) IS
  BEGIN
    --发送给准入评估人员
    FOR push_user_rec IN (SELECT DISTINCT su.user_id,
                                          su.email,
                                          su.description user_desc,
                                          su.mobile_phone
                            FROM hn_vendor_admi_report_head vah,
                                 hn_vendor_admi_report_line val,
                                 sys_user                   su
                           WHERE val.head_id = vah.head_id
                             AND val.score_user_id = su.user_id
                             AND nvl(su.frozen_flag, 'N') = 'N'
                             AND su.start_date <= SYSDATE
                             AND (su.end_date IS NULL OR su.end_date >= SYSDATE)
                             AND vah.head_id = p_event_param)
    LOOP
    
      sys_notify_message_pkg.insert_notify_recipient(p_message_id        => p_message_id,
                                                     p_recipient_type_id => p_recipient_type_id,
                                                     p_recipient_user_id => push_user_rec.user_id,
                                                     p_recipient_name    => push_user_rec.user_desc,
                                                     p_recipient_mobile  => push_user_rec.mobile_phone,
                                                     p_recipient_mail    => push_user_rec.email,
                                                     p_created_by        => p_user_id);
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'HN_EMIAL_SEND_PKG',
                                                     p_procedure_function_name => 'hn_admi_score_send');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END hn_admi_score_send;
  --现场考察评分通知
  PROCEDURE hn_cert_assess_score_send(p_message_id        NUMBER,
                                      p_event_param       NUMBER,
                                      p_recipient_id      NUMBER,
                                      p_recipient_type_id NUMBER,
                                      p_user_id           NUMBER) IS
  BEGIN
    --现场考察评分评估人员
    FOR push_user_rec IN (SELECT DISTINCT su.user_id,
                                          su.email,
                                          su.description user_desc,
                                          su.mobile_phone
                            FROM hn_site_report_line_score hs,
                                 sys_user                  su
                           WHERE hs.source_user_id = su.user_id
                             AND nvl(su.frozen_flag, 'N') = 'N'
                             AND su.start_date <= SYSDATE
                             AND (su.end_date IS NULL OR su.end_date >= SYSDATE)
                             AND hs.head_id = p_event_param)
    LOOP
    
      sys_notify_message_pkg.insert_notify_recipient(p_message_id        => p_message_id,
                                                     p_recipient_type_id => p_recipient_type_id,
                                                     p_recipient_user_id => push_user_rec.user_id,
                                                     p_recipient_name    => push_user_rec.user_desc,
                                                     p_recipient_mobile  => push_user_rec.mobile_phone,
                                                     p_recipient_mail    => push_user_rec.email,
                                                     p_created_by        => p_user_id);
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'HN_EMIAL_SEND_PKG',
                                                     p_procedure_function_name => 'hn_cert_assess_score_send');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END hn_cert_assess_score_send;

  --样件测试评估人员
  PROCEDURE hn_exemplar_report_send(p_message_id        NUMBER,
                                    p_event_param       NUMBER,
                                    p_recipient_id      NUMBER,
                                    p_recipient_type_id NUMBER,
                                    p_user_id           NUMBER) IS
  BEGIN
    --样件测试评估人员
    FOR push_user_rec IN (SELECT DISTINCT su.user_id,
                                          su.email,
                                          su.description user_desc,
                                          su.mobile_phone
                            FROM sys_user su
                           WHERE su.user_id IN ((SELECT het.quality_appraiser
                                                  FROM hn_exemplar_test het
                                                 WHERE het.exemplar_test_id = p_event_param),
                                                (SELECT het.technical_appraiser
                                                   FROM hn_exemplar_test het
                                                  WHERE het.exemplar_test_id = p_event_param))
                             AND nvl(su.frozen_flag, 'N') = 'N'
                             AND su.start_date <= SYSDATE
                             AND (su.end_date IS NULL OR su.end_date >= SYSDATE))
    LOOP
    
      sys_notify_message_pkg.insert_notify_recipient(p_message_id        => p_message_id,
                                                     p_recipient_type_id => p_recipient_type_id,
                                                     p_recipient_user_id => push_user_rec.user_id,
                                                     p_recipient_name    => push_user_rec.user_desc,
                                                     p_recipient_mobile  => push_user_rec.mobile_phone,
                                                     p_recipient_mail    => push_user_rec.email,
                                                     p_created_by        => p_user_id);
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'HN_EMIAL_SEND_PKG',
                                                     p_procedure_function_name => 'hn_exemplar_report_send');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END hn_exemplar_report_send;

  --小批量评估人员
  PROCEDURE hn_small_batch_send(p_message_id        NUMBER,
                                p_event_param       NUMBER,
                                p_recipient_id      NUMBER,
                                p_recipient_type_id NUMBER,
                                p_user_id           NUMBER) IS
  BEGIN
    --小批量评估人员
    FOR push_user_rec IN (SELECT DISTINCT su.user_id,
                                          su.email,
                                          su.description user_desc,
                                          su.mobile_phone
                            FROM sys_user su
                           WHERE su.user_id IN ((SELECT hst.technical_appraiser
                                                  FROM hn_small_batch_test hst
                                                 WHERE hst.small_batch_test_id = p_event_param),
                                                (SELECT hst.quality_appraiser
                                                   FROM hn_small_batch_test hst
                                                  WHERE hst.small_batch_test_id = p_event_param),
                                                (SELECT hst.product_appraiser
                                                   FROM hn_small_batch_test hst
                                                  WHERE hst.small_batch_test_id = p_event_param))
                             AND nvl(su.frozen_flag, 'N') = 'N'
                             AND su.start_date <= SYSDATE
                             AND (su.end_date IS NULL OR su.end_date >= SYSDATE))
    LOOP
    
      sys_notify_message_pkg.insert_notify_recipient(p_message_id        => p_message_id,
                                                     p_recipient_type_id => p_recipient_type_id,
                                                     p_recipient_user_id => push_user_rec.user_id,
                                                     p_recipient_name    => push_user_rec.user_desc,
                                                     p_recipient_mobile  => push_user_rec.mobile_phone,
                                                     p_recipient_mail    => push_user_rec.email,
                                                     p_created_by        => p_user_id);
    END LOOP;
  EXCEPTION
    WHEN OTHERS THEN
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' || SQLERRM,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'HN_EMIAL_SEND_PKG',
                                                     p_procedure_function_name => 'hn_exemplar_report_send');
      raise_application_error(sys_raise_app_error_pkg.c_error_number, sys_raise_app_error_pkg.g_err_line_id);
  END hn_small_batch_send;
END hn_emial_send_pkg;
/

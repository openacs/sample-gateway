declare
  foo integer;
begin
  foo := acs_sc_impl.delete_alias(
    'PaymentGateway',
    'sample-gateway',
    'Authorize'
  );

  foo := acs_sc_impl.delete_alias(
    'PaymentGateway',
    'sample-gateway',
    'ChargeCard'
  );

  foo := acs_sc_impl.delete_alias(
    'PaymentGateway',
    'sample-gateway',
    'Return'
  );

  foo := acs_sc_impl.delete_alias(
    'PaymentGateway',
    'sample-gateway',
    'Void'
  );

  foo := acs_sc_impl.delete_alias(
    'PaymentGateway',
    'sample-gateway',
    'info'
  );

  acs_sc_binding.delete(
    contract_name => 'PaymentGateway',
    impl_name => 'sample-gateway'
  );

  acs_sc_impl.delete(
    'PaymentGateway',
    'sample-gateway'
  );
end;
/
show errors

drop table sample_gateway_result_log;

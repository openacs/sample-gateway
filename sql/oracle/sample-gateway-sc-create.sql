--  This is a sample implementation of the PaymentGateway service contract

declare
  foo integer;
begin
  foo := acs_sc_impl.new(
	   'PaymentGateway',               	-- impl_contract_name
           'sample-gateway',                    -- impl_name
	   'sample-gateway'                     -- impl_owner_name
  );

  foo := acs_sc_impl.new_alias(
           'PaymentGateway',			-- impl_contract_name
           'sample-gateway',			-- impl_name
	   'Authorize', 			-- impl_operation_name
	   'sample_gateway.Authorize', 		-- impl_alias
	   'TCL'    				-- impl_pl
  );

  foo := acs_sc_impl.new_alias(
           'PaymentGateway',			-- impl_contract_name
           'sample-gateway',			-- impl_name
	   'ChargeCard', 			-- impl_operation_name
	   'sample_gateway.ChargeCard', 	-- impl_alias
	   'TCL'    				-- impl_pl
  );

  foo := acs_sc_impl.new_alias(
           'PaymentGateway',			-- impl_contract_name
           'sample-gateway',			-- impl_name
	   'Return', 				-- impl_operation_name
	   'sample_gateway.Return', 		-- impl_alias
	   'TCL'    				-- impl_pl
  );

  foo := acs_sc_impl.new_alias(
           'PaymentGateway',			-- impl_contract_name
           'sample-gateway',			-- impl_name
	   'Void', 				-- impl_operation_name
	   'sample_gateway.Void', 		-- impl_alias
	   'TCL'    				-- impl_pl
  );

  foo := acs_sc_impl.new_alias(
           'PaymentGateway',			-- impl_contract_name
           'sample-gateway',			-- impl_name
	   'info', 				-- impl_operation_name
	   'sample_gateway.info', 		-- impl_alias
	   'TCL'    				-- impl_pl
  );
end;
/
show errors

declare
        foo integer;
begin

        -- Add the binding
        acs_sc_binding.new (
            contract_name => 'PaymentGateway',
            impl_name => 'sample-gateway'
        );
end;
/
show errors


-- NOTE - this stuff is here because the naming is instance-specific.  I'm
-- not sure that is correct;  it would be better if it could be part of the
-- PaymentGateway specification.  However, for the purposes of an initial
-- release this will do.

-- In addition to all the usual service contract definitions, we also need
-- a table which will be used to log results of all our operations.  The
-- table is modeled after ec_cybercash_log in the old 3.x ecommerce code.
-- I tried to simplify it quite a bit, which means it will probably need more
-- columns added to it when it is actually being used in real life.
--
create table sample_gateway_result_log (
  transaction_id            integer not null,
  txn_attempted_type        varchar(25),
  txn_attempted_time        date,
  txn_returned_type         varchar(25),
  errmsg                    varchar(200),
  auth_code                 varchar(25),
  avs_code                  varchar(3),
  amount                    number
);

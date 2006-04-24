-- 
-- packages/sample-gateway/sql/postgresql/sample-gateway-sc-create.sql
-- 
-- @author Deds Castillo (deds@i-manila.com.ph)
-- @creation-date 2005-01-24
-- @arch-tag: 140e6170-d72b-4066-a486-6fabc49589d8
-- @cvs-id $Id$
--

--  This is a sample implementation of the PaymentGateway service contract

select acs_sc_impl__new(
	   'PaymentGateway',               	 -- impl_contract_name
       'sample-gateway',                 -- impl_name
	   'sample-gateway'                  -- impl_owner_name
);


select acs_sc_impl_alias__new(
       'PaymentGateway',			-- impl_contract_name
       'sample-gateway',			-- impl_name
	   'Authorize', 			    -- impl_operation_name
	   'sample_gateway.Authorize', 	-- impl_alias
	   'TCL'    				    -- impl_pl
);

select acs_sc_impl_alias__new(
       'PaymentGateway',			-- impl_contract_name
       'sample-gateway',			-- impl_name
	   'ChargeCard', 			    -- impl_operation_name
	   'sample_gateway.ChargeCard', -- impl_alias
	   'TCL'    				    -- impl_pl
);

select acs_sc_impl_alias__new(
       'PaymentGateway',			-- impl_contract_name
       'sample-gateway',			-- impl_name
	   'Return', 				    -- impl_operation_name
	   'sample_gateway.Return', 	-- impl_alias
	   'TCL'    				    -- impl_pl
);

select acs_sc_impl_alias__new(
       'PaymentGateway',			-- impl_contract_name
       'sample-gateway',			-- impl_name
	   'Void', 				        -- impl_operation_name
	   'sample_gateway.Void', 		-- impl_alias
	   'TCL'    				    -- impl_pl
);

select acs_sc_impl_alias__new(
       'PaymentGateway',			-- impl_contract_name
       'sample-gateway',			-- impl_name
	   'Info', 				        -- impl_operation_name
	   'sample_gateway.Info', 		-- impl_alias
	   'TCL'    				    -- impl_pl
);

-- Add the binding

select acs_sc_binding__new (
           'PaymentGateway',
           'sample-gateway'
);


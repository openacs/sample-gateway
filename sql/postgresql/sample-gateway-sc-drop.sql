-- 
-- packages/sample-gateway/sql/postgresql/sample-gateway-sc-drop.sql
-- 
-- @author Deds Castillo (deds@i-manila.com.ph)
-- @creation-date 2005-01-24
-- @arch-tag: 53839502-fad7-4fb3-a2d4-2f2f28c35c1f
-- @cvs-id $Id$
--

select acs_sc_binding__delete(
    'PaymentGateway',
    'sample-gateway'
);

select acs_sc_impl_alias__delete(
    'PaymentGateway',
    'sample-gateway',
    'Authorize'
);

select acs_sc_impl_alias__delete(
    'PaymentGateway',
    'sample-gateway',
    'ChargeCard'
);

select acs_sc_impl_alias__delete(
    'PaymentGateway',
    'sample-gateway',
    'Return'
);

select acs_sc_impl_alias__delete(
    'PaymentGateway',
    'sample-gateway',
    'Void'
);

select acs_sc_impl_alias__delete(
    'PaymentGateway',
    'sample-gateway',
    'Info'
);

select acs_sc_binding__delete(
    'PaymentGateway',
    'sample-gateway'
);

select acs_sc_impl__delete(
    'PaymentGateway',
    'sample-gateway'
);


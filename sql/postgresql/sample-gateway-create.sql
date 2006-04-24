-- 
-- packages/sample-gateway/sql/postgresql/sample-gateway-create.sql
-- 
-- @author Deds Castillo (deds@i-manila.com.ph)
-- @creation-date 2005-01-24
-- @arch-tag: cdccfb8f-0a0f-4c00-98ef-d1505f50048a
-- @cvs-id $Id$
--

create table sample_gateway_result_log (
  transaction_id 		    varchar(20) not null,
  txn_attempted_type        varchar(25),
  txn_attempted_time        timestamptz,
  txn_returned_type         varchar(25),
  errmsg                    varchar(200),
  auth_code                 varchar(25),
  avs_code                  varchar(3),
  amount                    numeric not null
);

\i sample-gateway-sc-create.sql

# some helper functions to simplify the ones below

# Write the results of the current operation to the database.  If it fails,
# log it but don't let the user know about it.
ad_proc sample_gateway.log_results {
    transaction_id
    txn_attempted_type
    txn_attempted_time
    txn_returned_type
    errmsg
    auth_code
    avs_code_zip
    avs_code_addr
    amount
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    if [catch {db_dml do-insert "insert into sample_gateway_result_log
(transaction_id, txn_attempted_type, txn_attempted_time, txn_returned_type, errmsg, auth_code, amount)
values
(:transaction_id, :txn_attempted_type, :txn_attempted_time, :txn_returned_type, :errmsg, :auth_code, :amount)"} errmsg] {
      ns_log Error "Wasn't able to do insert into sample_gateway_result_log for transaction_id $transaction_id;  error was $errmsg"
     }
}


# The heart of it all:  stub functions which can be used as a basis for a 
# new package - they all return something valid, and you can fill them in 
# one by one.  Many of the stubs are currently identical, as the whole 
# reason for their existence is in the gateway-specific stuff we're not
# implementing here.
#
# They used to all return not_implemented, but that didn't work too well
# for testing purposes, so at least until there is a module specific for
# testing (which there should be, so that occasional failures can be thrown
# in), all procs return success.

ad_proc sample_gateway.Authorize {
    transaction_id
    amount
    card_type
    card_number
    card_exp_month
    card_exp_year
    card_name
    billing_street
    billing_city
    billing_state
    billing_zip
    billing_country
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    # 1. Send transaction off to gateway
    #
    # Not implemented in this stub.

    # 2. Insert into log table
    #
    # Not implemented in this stub.

    # 3. Return result
    #
    # The result which comes back from the gateway will be looked at and then
    # the most appropriate of our canned return codes will be used.  This 
    # needs to be done in context, so it will be done in each function instead
    # of being split out on its own.
    # 
    # In particular, here we will need to check a package parameter to find
    # out whether they can be considered authorized if they fail AVS
    set return_values(response_code) [nsv_get payment_gateway_return_codes success]
    set return_values(reason) ""
    set return_values(transaction_id) $transaction_id
    return [array get return_values]
}

ad_proc sample_gateway.ChargeCard {
    transaction_id
    amount
    card_type
    card_number
    card_exp_month
    card_exp_year
    card_name
    billing_street
    billing_city
    billing_state
    billing_zip
    billing_country
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    # ChargeCard is a wrapper so we can present a consistent interface to
    # the end caller.  It will just pass on it's parameters to PostAuth,
    # AuthCapture or Charge, whichever is appropriate for the implementation
    # at hand.  Here, we are doing nothing.

    # We are returning the transaction_id we were given, but if this
    # wasn't just a stub we'd be returning the value that came back from 
    # the gateway.  We'd also be returning the value that was returned.
    set return_values(response_code) [nsv_get payment_gateway_return_codes success]
    set return_values(reason) ""
    set return_values(transaction_id) $transaction_id
    return [array get return_values]
}

# It's unlikely that a Return will need all this but I can imagine that
# one of the ultra-cheap services might want to validate the card again,
# giving them another chance to catch a bad card.
ad_proc sample_gateway.Return {
    transaction_id
    amount
    card_type
    card_number
    card_exp_month
    card_exp_year
    card_name
    billing_street
    billing_city
    billing_state
    billing_zip
    billing_country
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    # 1. Send transaction off to gateway
    #
    # Not implemented in this stub.

    # 2. Insert into log table
    #
    # Not implemented in this stub.

    # 3. Return result
    #
    # The result which comes back from the gateway will be looked at and then
    # the most appropriate of our canned return codes will be used.  This 
    # needs to be done in context, so it will be done in each function instead
    # of being split out on its own.
    set return_values(response_code) [nsv_get payment_gateway_return_codes success]
    set return_values(reason) ""
    set return_values(transaction_id) ""
    return [array get return_values]
}

# See comment on Return
ad_proc sample_gateway.Void {
    transaction_id
    amount
    card_type
    card_number
    card_exp_month
    card_exp_year
    card_name
    billing_street
    billing_city
    billing_state
    billing_zip
    billing_country
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    # 1. Send transaction off to gateway
    #
    # Not implemented in this stub.

    # 2. Insert into log table
    #
    # Not implemented in this stub.

    # 3. Return result
    #
    # The result which comes back from the gateway will be looked at and then
    # the most appropriate of our canned return codes will be used.  This 
    # needs to be done in context, so it will be done in each function instead
    # of being split out on its own.
    set return_values(response_code) [nsv_get payment_gateway_return_codes success]
    set return_values(reason) ""
    set return_values(transaction_id) ""
    return [array get return_values]
}

ad_proc sample_gateway.Info {
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    set info(package_key) sample-gateway
    set info(version) 1.0
    set info(package_name) "Sample Gateway"
    set info(cards_accepted) [ad_parameter -package_id [ad_conn package_id] CreditCardsAccepted ""]
    set info(success) [nsv_get payment_gateway_return_codes success]
    set info(failure) [nsv_get payment_gateway_return_codes failure]
    set info(retry) [nsv_get payment_gateway_return_codes retry]
    set info(not_supported) [nsv_get payment_gateway_return_codes not_supported]
    set info(not_implemented) [nsv_get payment_gateway_return_codes not_implemented]

    return [array get info]
}

# These stubs aren't exposed via the API - they are called only by ChargeCard.

ad_proc sample_gateway.PostAuth {
    transaction_id
    amount
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    # 1. Send transaction off to gateway
    #
    # Not implemented in this stub.

    # 2. Insert into log table
    #
    # Not implemented in this stub.

    # 3. Return result
    #
    # The result which comes back from the gateway will be looked at and then
    # the most appropriate of our canned return codes will be used.  This 
    # needs to be done in context, so it will be done in each function instead
    # of being split out on its own.
    set return_values(response_code) [nsv_get payment_gateway_return_codes success]
    set return_values(reason) ""
    set return_values(transaction_id) ""
    return [array get return_values]
}

ad_proc sample_gateway.AuthCapture {
    transaction_id
    amount
    card_type
    card_number
    card_exp_month
    card_exp_year
    card_name
    billing_street
    billing_city
    billing_state
    billing_zip
    billing_country
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    # 1. Send transaction off to gateway
    #
    # Not implemented in this stub.

    # 2. Insert into log table
    #
    # Not implemented in this stub.

    # 3. Return result
    #
    # The result which comes back from the gateway will be looked at and then
    # the most appropriate of our canned return codes will be used.  This 
    # needs to be done in context, so it will be done in each function instead
    # of being split out on its own.
    set return_values(response_code) [nsv_get payment_gateway_return_codes success]
    set return_values(reason) ""
    set return_values(transaction_id) ""
    return [array get return_values]
}

ad_proc sample_gateway.Charge {
    transaction_id
    amount
    card_type
    card_number
    card_exp_month
    card_exp_year
    card_name
    billing_street
    billing_city
    billing_state
    billing_zip
    billing_country
} {
    @author Janine Sisk; furfly.net, LLC (janine@furfly.net)
} {
    # 1. Send transaction off to gateway
    #
    # Not implemented in this stub.

    # 2. Insert into log table
    #
    # Not implemented in this stub.

    # 3. Return result
    #
    # The result which comes back from the gateway will be looked at and then
    # the most appropriate of our canned return codes will be used.  This 
    # needs to be done in context, so it will be done in each function instead
    # of being split out on its own.
    # 
    # In particular, here we will need to check a package parameter to find
    # out whether they can be considered authorized if they fail AVS
    set return_values(response_code) [nsv_get payment_gateway_return_codes success]
    set return_values(reason) ""
    set return_values(transaction_id) ""
    return [array get return_values]
}

# https://www.interviewquery.com/questions/upsell-transactions

import pandas as pd

def upsell_transactions(transactions: pd.DataFrame):

    transactions['created_at'] = pd.to_datetime(transactions['created_at'])
    
    first_purchase = transactions.groupby(by='user_id')['created_at'].min().reset_index()
    
    new_df = pd.merge(transactions, first_purchase, on='user_id')
    new_df = new_df[new_df['created_at_x'] > new_df['created_at_y']]

    return pd.DataFrame({'num_of_upsold_customers': [new_df['user_id'].nunique()]})
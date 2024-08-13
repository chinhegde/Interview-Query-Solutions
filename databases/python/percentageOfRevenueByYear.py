# https://www.interviewquery.com/questions/percentage-of-revenue-by-year

import pandas as pd

def percentage_of_revenue_by_year(annual_payments: pd.DataFrame):
    
    annual_payments['created_at'] = pd.to_datetime(annual_payments['created_at'])
    annual_payments['year'] = annual_payments['created_at'].dt.year

    revenue_by_year = annual_payments.groupby('year')['amount'].sum()

    percent_first = revenue_by_year[revenue_by_year.index.min()]
    percent_last = revenue_by_year[revenue_by_year.index.max()]

    total_revenue = revenue_by_year.sum()

    return pd.DataFrame({
        'percent_first': [round(percent_first*100/total_revenue, 2)],
        'percent_last': [round(percent_last*100/total_revenue, 2)]
    })
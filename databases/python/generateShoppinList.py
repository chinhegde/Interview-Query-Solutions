# https://www.interviewquery.com/questions/generate-shopping-list-from-recipes

import pandas as pd

def shopping_list(recipe1: pd.DataFrame,recipe2: pd.DataFrame,recipe3: pd.DataFrame):
   
   all_recipes = pd.concat([recipe1, recipe2, recipe3])

   groceries = all_recipes.groupby('grocery')['mass'].sum().reset_index()
   groceries.rename(columns={'mass': 'total_mass'}, inplace=True)

   return groceries
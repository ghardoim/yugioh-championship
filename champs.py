import streamlit as st
import pandas as pd

st.set_page_config(page_title="Bongas")
st.title("Yugioh Championship")

st.dataframe(pd.read_csv("total.csv"))
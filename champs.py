import streamlit as st
import pandas as pd

csscenter = "style='text-align: center;'"

st.set_page_config(page_title="Bongas", layout="centered")
st.write(f"<h1 {csscenter}>Yugioh Championship<h1>", unsafe_allow_html=True)

st.dataframe(pd.read_csv("total.csv"), hide_index=True)

pointsdf = pd.read_csv("points.csv")
pointsdf["round"] = pointsdf["round"].apply(lambda x: f"Round {x}")

for column in pointsdf.columns.drop(["player", "round", "matches", "tags"]):
    st.line_chart(pointsdf, x="round", y=column, color="player")

# st.dataframe(pd.read_csv("points.csv"), hide_index=True)

st.write(f"<h4 {csscenter}>History of Plays<h4>", unsafe_allow_html=True)
with st.container(height=500):

    for line in open("plays.txt", "r").readlines():
        st.write(f"<h4 {csscenter}>{line}<h3>" if "Round" in line else line,
            unsafe_allow_html=True)
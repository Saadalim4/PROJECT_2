#app.py
import streamlit as st
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from main import execute
import streamlit as st
from main import execute

st.set_page_config(page_title="🚀 Launch Weather AI", layout="centered")
st.title("🛰️ Multi-Agent SpaceX Launch & Weather Checker")

goal = st.text_input("Enter your goal:", "Check SpaceX launch weather impact")

st.subheader("🌍 Enter Location Details")

city = st.text_input("City Name")
lat = st.text_input("Latitude")
lon = st.text_input("Longitude")

if st.button("Run Multi-Agent System"):
    with st.spinner("Processing..."):
        result = execute(goal, city, lat, lon)

    st.subheader("🔭 Next Launch Info")
    st.json(result.get("launch", {}))

    st.subheader("🌦️ Weather Details")
    st.json(result.get("weather", {}))

    st.subheader("📋 Final Summary")
    st.success(result.get("summary", "No summary available"))
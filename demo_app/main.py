import streamlit as st

st.title("Hello, Streamlit!")

if st.button("Click Me"):
    st.write("Button clicked!")

user_input = st.text_input("Your name:")
if user_input:
    st.write(f"Hello, {user_input}!")

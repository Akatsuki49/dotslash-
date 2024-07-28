# padh.ai - now, you can “talk” to videos.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [ScreenShots](#screenshots)
- [How It Works](#how-it-works)
- [Tech Used](#tech-used)

## Introduction

*padh.ai* is An edtech app with courses, videos, chat, and FAQ.

What padh.ai aims at solving:
- Limited 1-on-1 interaction in online lectures
- Students getting distracted while looking up topics they need help with.
- Making doubt-solving more convenient and fast, feeding curiosity instantly.

Thus, enhancing overall academic performance and confidence of students

## Features

- Browse and watch video courses
- Ask questions related to the video content or slides content using a chat interface
- View relevant materials like articles for each video


## Screenshots

<table>
  <tr>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/424ff7ed-dcf1-42f9-821a-6b9431b1af44" alt="Screenshot 1"><br>SignUp Screen</td>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/3612687b-458a-4020-b89c-c083ceb40917" alt="Screenshot 2"><br>Login Screen</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/47a82377-f400-4261-a0f3-911d9ff29ada" alt="Screenshot 3"><br>Dashboard 1</td>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/9b6ad268-1e31-45b9-8eb7-64a3db733302" alt="Screenshot 4"><br>Dashboard 2</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/fc655910-2113-43cc-bb33-f433eb9926d9" alt="Screenshot 5"><br>Topic Review</td>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/74ba74fc-8b5b-4096-827f-3c646d85b365" alt="Screenshot 6"><br>AV Summary Video Player</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/e3dbb7ce-1320-49a9-8c1c-82f5a300d51c" alt="Screenshot 7"><br>What is SOAP? 1</td>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/40c39236-a17e-470b-b27b-5281bcde0444" alt="Screenshot 8"><br>What is SOAP? 2</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/01a3980d-1309-40c4-8dc4-faec1a8f5297" alt="Screenshot 9"><br>Context Aware LLM Answer</td>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/93187a3f-a4dc-4ec3-a081-cad0230d2a09" alt="Screenshot 10"><br>Context</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/ada03406-900c-4aea-9597-7a133ca0c022" alt="Screenshot 11"><br>Who is the Curator of Slides ?</td>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/c75ca0cf-5f80-422d-9f6d-d08b525b6e24" alt="Screenshot 12"><br>Server Side Logs</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/b512476f-07ab-4b6e-9ed9-b43ab53210f5" alt="Screenshot 13"><br>More RAG Testing 1</td>
    <td><img src="https://github.com/Akatsuki49/dotslash-/assets/95576716/065d5ed7-76d0-43b2-9ed8-709f23e7b3de" alt="Screenshot 14"><br>More RAG Testing 2</td>
  </tr>
</table>


## How It Works!

padh.AI is built using Flutter for the frontend, FastAPI for the backend, OpenAI's GPT-3.5 turbo for querying, FAISS (Facebook AI Similarity Search) library in python for RAG (Retrieval Augmented Generation) and Firebase for authentication. 
Here's how it works:

1. **User Authentication:**
   - Users can sign up or log in using their email and password via Firebase authentication, or can utilize Google OAuth to login/sign in.

2. **Courses Dashboard**
   - Upon logging in, users are presented with a scrollable carousel of different courses and different Units under each course: A prospective redesign of the courses dashboard of the PESU App.
   - The User can select the topic that he wants to study. Each topic has a summary video along with relevant course content/slides.
  
3. **Context-Aware Chatbot**
   - The chatbot utilizes video and slide transcriptions stored in a vector database, providing accurate and context-specific answers to student queries.
   - A separate backend service converts each topic's summary video (audio to text using deepgram), and slides into vector embeddings. It stores them in a .faiss file so the chatbot is context-aware of that specific topic.

4. **Advanced Query Processing**
   - Using OpenAI’s GPT-3.5 turbo, student questions are matched with relevant content through FAISS, minimizing errors and enhancing the learning experience.

## Tech-Used

- **Frontend:** Flutter - An open source cross-platform UI framework, using which the beautiful screens of bh.AI were built
- **Backend:** FastAPI - Backend for the app, uses Python, performs RAG embeddings on content as well as queries the LLM using system and user prompts
- **langchain:** Framework to integrate LLMs customized for different use Cases
- **FAISS(Facebook AI Similarity Search):** A library for efficient similarity search and clustering of dense vectors.
- **OpenAI Embeddings:** Used to created an information-dense representation of the semantic meaning of a piece of text.
- **deepgram:** Audio to Text ML model
- **AI Querying:** GPT 3.5 - The most popular LLM today.
- **Authentication:** Firebase - Backend as a Service software used to manage user authentication.
- **Ngrok:** Helps developers expose their local development server to the internet.

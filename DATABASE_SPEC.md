# EternalMind AI Database Specification

Database

SQLite

Engine

Drift

Cache

Hive

Secure

flutter_secure_storage

------------------------------------------------

Rules

Flutter schema MUST equal Web schema.

Every table must have

id

createdAt

updatedAt

Every child table contains

humanId

Foreign Keys enabled.

Cascade delete enabled.

Indexes required on

humanId

date

title

category

tags

------------------------------------------------

Tables

humans

family_members

education

career_history

skills

languages

interests

goals

personality_traits

conversation_styles

daily_habits

values_beliefs

favorite_quotes

favorite_words

life_places

life_stories

timeline

daily_journals

memories

memory_tags

memory_links

memory_cache

memory_search_logs

documents

photo_albums

photos

audio_files

voice_settings

avatars

legacy_messages

chat_history

ai_providers

ai_settings

downloaded_models

settings

------------------------------------------------

Storage

SQLite

Permanent Data

Hive

Fast Cache

Secure Storage

API Keys

Encryption Keys

Tokens

Biometric Secret

------------------------------------------------

Relationships

Human

↓

Family

↓

Education

↓

Career

↓

Timeline

↓

Stories

↓

Journals

↓

Memories

↓

Photos

↓

Documents

↓

Voice

↓

Legacy

↓

Chat

------------------------------------------------

Import

JSON

SQL

ZIP

Export

JSON

SQL

ZIP

Encrypted Backup

------------------------------------------------

Future

Vector Database

Embeddings

Plugin Tables

Avatar Cache

Video Cache

Voice Cache

LLM Cache

Model Downloads
# EternalMind AI
## Digital Human Platform
Version: 2.0
Architecture: Offline First
Platform:
- Android
- iOS
- Windows
- macOS
- Linux
- (Web later)

---

# IMPORTANT

Before writing ANY code you MUST read this file.

Never redesign the architecture without approval.

Every feature must follow this document.

The goal is to build a production-quality Digital Human platform.

This project is NOT a chatbot.

It is an AI-powered Digital Human / Memory Preservation platform.

---

# Project Vision

EternalMind AI allows a user to create a Digital Human.

The Digital Human should:

• remember everything

• talk naturally

• speak using cloned voice

• understand memories

• know family

• know education

• know career

• know personality

• know beliefs

• know life events

• answer like the real person

• eventually support realistic talking avatar

Everything must work locally first.

Cloud AI is optional.

---

# Development Rules

DO NOT redesign UI randomly.

DO NOT rename database columns.

DO NOT change model names.

DO NOT remove existing fields.

DO NOT break previous data.

Always extend.

Never replace.

Every screen must compile.

No placeholder widgets.

No fake buttons.

No TODO screens.

Every button must perform a function.

---

# Design Language

Theme:

Dark futuristic

Glassmorphism

Cyberpunk

Neon

Minimal

Premium

Colors

Purple

Cyan

Pink

Deep Blue

Rounded Cards

Large spacing

Smooth animations

No Material default appearance.

Everything custom.

---

# UI Priority

UI first.

Then functionality.

Then optimization.

---

# Platform Support

Single Flutter codebase.

Must support

Android

iOS

Windows

macOS

Linux

Responsive later.

For now mobile-first.

---

# Local First

Everything stored locally.

Primary Database

Drift SQLite

Secondary Storage

Hive

Secure Storage

flutter_secure_storage

No internet required for memories.

---

# Data Flow

Profile

↓

SQLite

↓

Memory Engine

↓

AI Context Builder

↓

AI Provider

↓

Response

↓

Conversation Saved

↓

Memory Updated

---

# User Flow

Splash

↓

Create Digital Human

OR

Import JSON Backup

↓

Profile Wizard

↓

Dashboard

↓

Chat

↓

Voice

↓

Memory

↓

Settings

---

# Profile Creation

Wizard based.

Step by step.

Each step auto saves.

Resume if app closes.

Each step writes immediately to SQLite.

No data loss.

---

# Import Backup

Support JSON.

User selects file.

Preview.

Validate schema.

Import.

Set as Active Profile.

No internet required.

---

# Multiple Profiles

Unlimited.

Only one Active Profile.

Switch instantly.

Editable.

Deletable.

Exportable.

Cloneable.

---

# Database

Everything must match Web project schema.

Flutter schema must never diverge.

Field names must remain identical.

If Web adds a field

Flutter adds same field.

---

# Memory System

The AI should remember

Personal Info

Family

Education

Career

Stories

Journal

Timeline

Photos

Voice

Documents

Goals

Skills

Values

Personality

Quotes

Relationships

Legacy Messages

Everything searchable.

---

# Chat Engine

Chat is NOT normal ChatGPT.

It must answer as the Digital Human.

Pipeline

User Question

↓

Search Memories

↓

Build Context

↓

Send Context to AI

↓

Receive Response

↓

Save Conversation

↓

Update Memory

---

# Memory Retrieval

Always search

Timeline

Stories

Journal

Education

Career

Family

Photos

Documents

Goals

Voice Notes

Before calling AI.

Never answer without memory search.

---

# AI Providers

Support unlimited providers.

Examples

OpenAI

Groq

Gemini

OpenRouter

Claude

DeepSeek

Mistral

Cohere

Together

Perplexity

Fireworks

Ollama

LM Studio

Custom API

OpenAI Compatible APIs

---

# Provider Features

Encrypted API Keys

Priority

Latency

Health

Retry

Streaming

Vision

Embeddings

Speech

Image Generation

Model Detection

---

# Automatic Failover

If Provider fails

Retry

↓

Retry

↓

Retry

↓

Switch Provider

↓

Continue Conversation

Never lose chat.

Show popup

"Groq unavailable.
Switched to Gemini."

Conversation continues automatically.

---

# AI Models

Support any model.

Examples

GPT

Claude

Gemini

Llama

Qwen

DeepSeek

Mistral

Phi

Gemma

Custom

Model names stored in database.

Never hardcode.

---

# Voice

Future Architecture

Whisper STT

↓

Memory Search

↓

AI

↓

TTS

↓

Lip Sync

↓

Avatar

Everything modular.

---

# Avatar

Future Ready

Support

Live2D

Ready Player Me

Talking Head

SadTalker

Wav2Lip

MuseTalk

HeyGen style

Digital Human

Never hardcode.

---

# Family Tree

Interactive.

Zoom.

Pan.

Relationships.

Photos.

Connections.

---

# Timeline

Chronological.

Filter.

Search.

Photos.

Documents.

Voice.

Journal.

Everything linked.

---

# Photo Vault

Albums

AI Tagging

Face Recognition later

Locations

Timeline Links

---

# Voice Vault

Voice recordings

Transcripts

Speaker notes

Emotion

Date

---

# Documents

PDF

Word

Text

Markdown

Images

OCR later

Searchable

---

# Search

Global Search

Everything searchable

Profile

Story

Family

Education

Journal

Photo

Voice

Document

Timeline

---

# Dashboard

Must show

Profile

Statistics

Quick Actions

Recent Activity

Provider Status

Memory Health

Conversation Count

Storage

Never empty.

---

# Settings

Tabs

General

Appearance

AI Providers

Voice

Storage

Backup

Developer

---

# Security

API Keys encrypted.

Never plain text.

Local encryption.

---

# Error Handling

Global popup.

Works from every screen.

Examples

Connection failed

API Invalid

Provider Switched

Backup Failed

Import Complete

Storage Full

---

# Performance

Lazy Loading

Pagination

Caching

Background indexing

No UI lag.

---

# Coding Rules

Use Riverpod.

Use Repository Pattern.

Use Services.

Use Clean Architecture.

Use Feature First folders.

Avoid massive files.

Reusable widgets only.

---

# Future Phases

Phase 1

Core UI

Profile

Import

Database

Dashboard

Completed first.

Phase 2

Chat

Memory Engine

AI Providers

Conversation

Phase 3

Voice

Speech

Streaming

Phase 4

Avatar

Lip Sync

Digital Human

Phase 5

Memory Intelligence

Semantic Search

Embeddings

Phase 6

Offline AI

Ollama

llama.cpp

MLC

Phase 7

Video Avatar

Real-time Digital Human

---

# Final Goal

The application should become an offline-first Digital Human platform where a person can preserve their memories, personality, voice, relationships, knowledge, and life history.

The AI should answer exactly as that person would, using retrieved memories and profile context instead of generic chatbot responses.

Every new feature must move the project toward this vision.
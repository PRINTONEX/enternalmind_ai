# EternalMind AI
# Master Schema

Version: 2.0

This file defines every model used by EternalMind.

Flutter MUST match Web.

Never rename fields.

Never delete fields.

Always extend.

------------------------------------------------

ROOT

Human

├── Profile

├── Family

├── Education

├── Career

├── Skills

├── Languages

├── Interests

├── Goals

├── Values

├── Personality

├── Conversation Style

├── Daily Habits

├── Life Stories

├── Memories

├── Timeline

├── Journals

├── Documents

├── Photos

├── Voice Vault

├── Legacy Messages

├── AI Settings

├── AI Providers

├── Chat History

├── Avatar

├── Voice Settings

└── Backup

------------------------------------------------

Profile

id

photoPath

fullName

nickname

birthDate

birthPlace

currentCity

nationality

religion

gender

maritalStatus

occupation

about

favoriteQuotes

lifePhilosophy

hobbies

languages

createdAt

updatedAt

------------------------------------------------

Family

id

humanId

name

relationship

birthYear

description

photoPath

closeness

createdAt

------------------------------------------------

Education

id

humanId

type

course

degree

school

startYear

endYear

achievements

certificatePath

------------------------------------------------

Career

id

humanId

company

position

location

startDate

endDate

responsibilities

achievements

------------------------------------------------

Story

id

humanId

sectionKey

title

content

tags

emotion

importance

createdAt

------------------------------------------------

Timeline

id

humanId

title

description

date

year

location

emotion

importance

photos

documents

------------------------------------------------

Journal

id

humanId

date

mood

weather

location

journalText

voicePath

tags

favoriteMoment

lessonsLearned

------------------------------------------------

Memory

id

humanId

title

description

category

date

emotion

location

importance

privacy

tags

embeddingId

------------------------------------------------

Photo

id

humanId

albumId

path

caption

takenDate

location

people

tags

------------------------------------------------

Document

id

humanId

title

category

description

path

createdAt

------------------------------------------------

Voice

id

humanId

path

transcript

duration

emotion

language

provider

createdAt

------------------------------------------------

Legacy

id

humanId

recipient

relationship

message

trigger

deliveryRule

createdAt

------------------------------------------------

AI Provider

id

provider

providerType

apiKey

baseUrl

model

temperature

topP

maxTokens

timeout

priority

status

latency

failures

requests

cost

------------------------------------------------

Chat

id

humanId

role

message

attachments

sources

provider

model

createdAt

------------------------------------------------

Avatar

id

humanId

image

style

expression

clothing

prompt

isDefault

------------------------------------------------

Voice Settings

sttProvider

ttsProvider

voiceModel

accent

pitch

speed

volume

emotion

pauseDuration

------------------------------------------------

Backup

Profile

Settings

Providers

Memories

Photos

Documents

Voice

Timeline

Stories

Family

Journal

Everything

------------------------------------------------

Future

Embeddings

Knowledge Graph

Vector Memory

Video Avatar

Emotion History

Lip Sync

Downloaded Models

Plugins
# Airbnb Database Schema (DDL)

## Overview

This schema defines the core structure of an Airbnb-like relational database. The design includes six main tables and incorporates best practices such as:

- Primary and foreign key constraints
- ENUM usage for controlled values
- Indexing for performance
- Timestamps for historical tracking

## How to Run

To execute the schema on PostgreSQL (or similar RDBMS):

```bash
psql -U your_user -d your_database -f schema.sql

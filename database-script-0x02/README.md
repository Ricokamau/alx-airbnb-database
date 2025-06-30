# Airbnb Sample Data – Seed Script

## Overview

This seed file (`seed.sql`) contains sample data to populate the Airbnb relational database for development, testing, and demonstration purposes.

## Contents

The seed file inserts data into the following tables:

- **Users:** 7 users (2 guests, 2 hosts, 1 admin, 2 extra users for diversity)
- **Properties:** 4 properties hosted by different users
- **Bookings:** 4 bookings linked to valid users and properties
- **Payments:** 3 payments for confirmed bookings
- **Reviews:** 3 reviews tied to completed bookings
- **Messages:** Simulated conversations between users (guest ↔ host, guest ↔ admin)

## How to Run

Make sure the schema has been created first using `schema.sql`, then run:

```bash
psql -U your_user -d your_database -f seed.sql

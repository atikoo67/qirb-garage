# Qirb Garage Mobile Implementation Guide

Welcome to the **Qirb Garage Platform** mobile development technical documentation. This document is designed to guide mobile developers in building the frontend application for **Garage Owners, Staff, Sellers, and Customers**.

> [!IMPORTANT]
> **Administrative functionalities (Admin Role) must be completely excluded from the mobile application.** The mobile app is strictly focused on operational and consumer-facing features.

---

## 1. Project Overview & Architecture

Qirb is a centralized ecosystem for the automotive service industry in Ethiopia. The system facilitates garage bookings, spare part sales, and technical knowledge sharing.

- **Architecture**: Client-Server (REST API)
- **Backend Tech Stack**: Node.js, Express, Sequelize (MySQL Data Store)
- **Authentication**: JWT (JSON Web Tokens)
- **Real-time**: Messaging and state-synchronized notifications

---

## 2. Role-Based Module Specifications

The mobile application must provide tailored experiences for the following four roles:

### 📱 Customer Module
*Primary Goal: Frictionless discovery and service management.*
- **Garage Discovery**: Interactive search for verified garages by location (Addis Ababa), specialty, and rating.
- **Service Bookings**: end-to-end booking flow including vehicle details, service selection, and scheduling.
- **Part Marketplace**: Browse verified sellers, check Ref Numbers, and submit inquiry requests.
- **Technical Library**: Mobile-optimized access to shared vehicle service manuals.

### 🛠️ Staff Module (Mechanics)
*Primary Goal: Workshop efficiency and real-time execution.*
- **Protocol Management**: View assigned service requests for the current shift.
- **Workflow State**: Integrated controls to update job status (ACCEPTED → IN_PROGRESS → COMPLETED).
- **Just-in-Time Docs**: Instant lookup of vehicle-specific manuals while on the shop floor.

### 🏢 Garage Owner Module
*Primary Goal: Operational oversight and personnel management.*
- **Command Center**: Real-time monitoring of all active bookings and staff workloads.
- **Resource Allocation**: Assign or reassign staff to incoming garage service requests.
- **Merchant Profile**: Manage the garage's digital presence and verified services.

### 🛒 Spare Part Seller Module
*Primary Goal: Inventory velocity and inquiry response.*
- **Catalog Management**: List new inventory with condition (New/Used), price (ETB), and compatibility data.
- **Inquiry Handling**: Receive and respond to direct product requests from customers.
- **Sales Tracking**: Monitor request statuses and finalized transactions.

---

## 3. API Integration & Protocol

### Base URL & Connectivity
- **Development**: `http://localhost:5000/api`
- **Media Access**: Uploads (photos, documents) are served from the `/uploads` registry.

### Secure Authentication
1. **Handshake**: `POST /auth/login` (email/password).
2. **Token Management**: JWT must be stored in secure storage (Keychain/Secure Storage).
3. **Authorization**: All protected calls MUST include `Authorization: Bearer <TOKEN>`.
4. **Active Session**: Use `GET /auth/me` to refresh user context and verify active roles.

### Primary Role Identifiers
Ensure navigation switches based on the `user.role` payload:
- `CUSTOMER`
- `GARAGE_OWNER`
- `STAFF`
- `SELLER`

---

## 4. Key Implementation Surfaces

| Subsystem | Primary Endpoints | Target Roles |
| :--- | :--- | :--- |
| **Auth** | `/auth/login`, `/auth/register` | All |
| **Discovery** | `/garages`, `/spare-parts` | Customer |
| **Service** | `/bookings`, `/staff-dashboard` | Customer, Staff, Owner |
| **Market** | `/spare-part-requests` | Customer, Seller |
| **Comms** | `/messages`, `/notifications` | All |

---

## 5. Design Language & UX Guidelines

The mobile experience should feel like a premium extension of the core platform, maintaining the **Indigo/Slate** brand identity.

- **Theme**: Premium Indigo-centered palette.
- **Headers**: Maintain the "Indigo Table Header" aesthetic (`bg-indigo-100`) for all data lists.
- **Typography**: High-density sans-serif fonts (e.g., Inter, Outfit).
- **States**: Clear visual distinction between job statuses (Amber: Pending, Indigo: Active, Emerald: Complete).

---

## 6. Project Setup for Testing

1. Clone the core repository.
2. Ensure you have a running MySQL instance.
3. Configure the `.env` file in the `/backend` directory.
4. Execute `npm install` followed by `npm run dev` to launch the local API server.

---

© 2026 Qirb Garage Platform. All rights reserved.

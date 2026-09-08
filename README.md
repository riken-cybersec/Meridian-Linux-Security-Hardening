# Meridian Financial Services – Linux Security Hardening

A practical Linux server security hardening and monitoring project developed for the Meridian Financial Services security case study.

## 📌 Project Overview

Meridian Financial Services stores sensitive KYC documents, account numbers, and transaction histories on an internal Linux server.

The objective of this project was to harden the Linux server, restrict unauthorized access, implement layered security controls, monitor security events, configure automated alerting, and validate backup and recovery.

## 🎯 Objectives

- Restrict Linux server access to an authorized administrator workstation
- Harden SSH remote access
- Implement firewall-based access control
- Prevent SSH brute-force attacks
- Deploy network intrusion detection/prevention
- Monitor security-sensitive system activity
- Configure automated security alerts
- Apply least-privilege access controls
- Automate security auditing
- Implement and validate backup and restore

## 🛡️ Security Controls Implemented

| Security Control | Purpose |
|---|---|
| SSH Hardening | Secure remote administration |
| SSH Key Authentication | Reduce password-based attack risk |
| UFW Firewall | Restrict inbound network access |
| Fail2ban | Detect and block repeated SSH failures |
| Suricata IDS/IPS | Network traffic detection and prevention |
| auditd | Host-level security auditing |
| Postfix | Security email notifications |
| Cron | Automated scheduled tasks |
| Log Rotation | Manage security log growth |
| NTP / Time Synchronization | Maintain accurate event timestamps |
| Backup & Restore | Data recovery and resilience |
| Least Privilege | Restrict unnecessary user privileges |

## 🏗️ Security Architecture

The architecture includes:

**Internet → Perimeter Firewall → IDS/IPS → Authorized Windows Workstation → Linux Server**

Host-based controls such as UFW, Fail2ban, auditd and authentication monitoring provide additional protection on the Linux server.

## 🔐 SSH Security

Implemented:

- SSH key-based authentication
- SSH configuration hardening
- Remote root login restriction
- Password authentication restrictions
- Authorized workstation-based access

## 🔥 Firewall & Brute-Force Protection

### UFW
Configured host-level firewall rules to restrict inbound SSH access to the authorized administrator workstation.

### Fail2ban
Configured SSH brute-force protection to detect repeated failed authentication attempts and automatically ban the attacking IP.

## 🛰️ Suricata IDS/IPS

Suricata was implemented for network security monitoring and intrusion detection/prevention.

Validation included:

- Configuration testing
- Service status verification
- Alert detection
- Installation verification

## 📋 Linux Auditing

`auditd` was configured to monitor security-sensitive activities including:

- Authentication activity
- `/etc/passwd`
- `/etc/shadow`
- SSH configuration
- Sensitive data directory
- Identity and account changes

## 📧 Security Alerting

Postfix was configured for local security email notifications.

Security events included:

- Root console login
- Defined security events
- Authentication-related activity

## ⚙️ Automation

A shell-based daily security audit was configured and scheduled using Cron.

Cron was also used to schedule the hourly backup process.

## 💾 Backup & Recovery

The project implemented an hourly backup process using the Linux `tar` utility.

Example backup command:

```bash
tar -czf /backup/meridian/meridian-backup-$(date +\%Y\%m\%d-%H\%M).tar.gz /srv/meridian-data

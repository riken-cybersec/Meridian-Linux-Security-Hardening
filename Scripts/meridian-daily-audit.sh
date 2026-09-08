#!/bin/bash

echo "========================================"
echo "      MERIDIAN DAILY SECURITY AUDIT"
echo "========================================"
echo "Date: $(date)"
echo

echo "[1] Failed SSH Authentication Attempts"
echo "----------------------------------------"
grep -iE "Failed password|authentication failure|Invalid user" /var/log/auth.log | tail -10
echo

echo "[2] Recent Auditd Security Events"
echo "----------------------------------------"
ausearch -k meridian_data -ts recent -i 2>/dev/null | tail -10
ausearch -k meridian_ssh -ts recent -i 2>/dev/null | tail -10
ausearch -k identity_changes -ts recent -i 2>/dev/null | tail -10
echo

echo "[3] Fail2ban SSH Status"
echo "----------------------------------------"
fail2ban-client status sshd 2>/dev/null
echo

echo "[4] Critical File Permissions"
echo "----------------------------------------"
ls -l /etc/passwd /etc/shadow /etc/ssh/sshd_config
echo

echo "[5] Security Services"
echo "----------------------------------------"
systemctl is-active auditd
systemctl is-active suricata
systemctl is-active fail2ban
echo

echo "========================================"
echo "        AUDIT COMPLETED"
echo "========================================"

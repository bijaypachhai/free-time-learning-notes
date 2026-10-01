# fail2ban: Server local WAF

```bash
## CHECK JAILS ENABLED
## JAILS ARE PRESENT IN /etc/fail2ban/jail.d/
sudo fail2ban-client status <JAIL_NAME>

## CHECK LINES MATCHING IN LOG FILE
sudo fail2ban-regex /var/log/nginx/access.log /etc/fail2ban/filter.d/nginx-http-auth.conf --print-all-matched
```

### References

[Linux Security Blog: What is fail2ban ?](https://linuxsecurity.com/features/what-is-fail2ban)

[Hostinger Blog: Configure fail2ban](https://www.hostinger.com/tutorials/fail2ban-configuration)

[Jellyfin Blog: Advanced Configuration](https://jellyfin.org/docs/general/post-install/networking/advanced/fail2ban/#advanced-fail2ban-setup-forwarding-and-managing-bans-on-an-upstream-proxy-server)

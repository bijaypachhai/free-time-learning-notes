# Errors

## Creating pods with `dnsutils.yaml`

```markdown
Error from server (Forbidden): error when creating "dnsutils.yaml": pods "dnsutils" is forbidden: error looking up service account default/default: serviceaccount "default" not found
```

```bash
$ k get nodes -o custom-columns=NODE:.metadata.name,POD_CIDR:.spec.podCIDR
```
The output shows
|NODE     | POD_CIDR  |
|---------|-----------|
|node-0   | <none>    |
|node-1   | <none>    |
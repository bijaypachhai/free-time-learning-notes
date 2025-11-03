# Assuming Roles in AWS

A role has permissions associated with it. Assuming a role is like putting on a hat; you temporarily have the permissions that come with the har, but you don't wear it to bed at night.

## Need behind Assuming Roles

There's two concepts of security and identity. Identity (WHO someone is) and permissions (WHAT someone is allowed to do). In AWS, you can assign permissions directly to a user (user is WHO, permissions are WHAT). But often times it's helpful to identify and define a **ROLE**. A role is a set of permissions often organized by job title or function. For example, you might create a **Developer** role that has permissions that all your developers need.

The nice thing about a role is that it is not tied to identity (WHO) meaning you can allow lots of differnt identities to use that same **ROLE**. When someone uses a **ROLE**, it's called assuming that role. That is, taking on that permission set, often temporarily.

```markdown
When you assume an IAM role, you're not actually using that role, what it does is creating an sts temporary session based on that IAM role,
that's why when you assume an IAM role, your arn becames something like arn:aws:sts::<account-id>:assumed-role/<role-name>/<session-name> .
I mean, it's a STS resource, not an IAM resource. The session's duration is defined by the IAM role too.
Also when you assume an IAM role you lost your original identity, i mean, if you're using an IAM User to assume an IAM role,
you will lost your IAM user permissions while you're using the role permissions (through the STS session)
```

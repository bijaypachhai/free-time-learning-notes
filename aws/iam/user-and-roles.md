# IAM Users and Roles

```markdown
AWS IAM Users and IAM Roles serve different purposes for managing access to resources.

An IAM User represents a specific individual or application and has long-term credentials
like access keys or passwords, making it suitable for persistent access.

In contrast, an IAM Role is a temporary identity assumed by trusted entities (users, applications, or AWS services)
to gain temporary credentials via sts:AssumeRole, designed for short-term access, cross-account scenarios, or service-to-service communication.

Roles are better suited for applications or services needing temporary access, while IAM Users are ideal for human users requiring ongoing access.
```

## Key Differences

In AWS Identity and Access Management (IAM), both users and roles are crucial for managing access to resources.

- **IAM Users**: represent individual people or applications that interact with AWS. Each user has a name, password, and API Access Keys. They are directly granted permissions based on administrator-defined policies.

- **IAM Roles**: are a collection of permissions designed to be easily assigned to users. Instead of granting individual permissions one-by-one, a user can be given a role that encapsulates all the necessary permissions for a specific task.

The fundamental difference is that users represent **entities** needing access, while roles represent sets of **permissions** that can be applied to users.

- Users have credentials like passwords and API keys.
- Roles do not have credentials. They are assumed or **taken on** by users. This allows you to grant multiple permissions with a single role assignment instead of individual grants of permissions.

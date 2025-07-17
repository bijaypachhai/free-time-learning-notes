# Self Managed Gitlab Community Edition
We are installing Gitlab Community Edition in on-premises Ubuntu server. And documenting the steps, issues and solutions during the entire process of installation.


## Change Root password
In case the root password is forgotten, but there is access to the machine hosting Gitlab, we can change the `root` user password with following commands.

```bash
$gitlab-rake 'gitlab:password:reset[root]'

## alternatively we can use
$gitlab-rake "gitlab:password:reset[root]" << EOF
> {Your-new-password}
> {Your-new-password}
> EOF


## alternatives
$gitlab-rails console
> user = User.find_by_username 'root'
> user.password = "Your-new-password"
> user.password_confirmation = "Your-new-password"
> user.send_only_adm in_changed_your_password_notification!
> user.save!
> exit 
```
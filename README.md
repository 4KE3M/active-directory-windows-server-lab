<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Active Directory Domain with Group Policy

**Project Link:** [View Project](https://nextwork.ai/projects/c535e3a2-10b3-4008-9ff9-0bb284b11497)

**Author:** Akeem Adams  

---

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_rfrd3bmb)

## Setting Up the Active Directory Domain

### Project goals and sysadmin relevance

In this project, I built a Windows Server Active Directory domain environment to gain hands-on experience administering enterprise Windows infrastructure. I configured Active Directory Domain Services, organizational units, users, and security groups, Group Policy, DNS, and DHCP, while using PowerShell to automate common administrative tasks.

### Promoting the server to a Domain Controller

In this step, I configured a Windows Server 2022 system to serve as a Domain Controller. I renamed the server, configured networking, installed Active Directory Domain Services, and created a new Active Directory forest and domain.

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_r25id4jz)

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_rfrd3bmb)

### Domain name and DNS configuration

I configured corp.lab as the domain name for my Active Directory forest. The DNS server points to 127.0.0.1 because that is the loopback address, meaning the server is pointing to itself. Since DC01 is also running the DNS service for the domain, it can use its own DNS server to resolve domain names and locate Active Directory services.

## Building the Organizational Structure

### Creating OUs, users, and security groups

In this step, I organized Active Directory by creating separate OUs for IT, HR, and Sales, then created user accounts and security groups for each department. This structure let me manage users by department, apply Group Policies to specific OUs, and assign access through security group membership.

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_gegrj7ly)

### How OUs and groups enable targeted management

OUs helped me organize users, computers, and other objects by department and make it easier to apply Group Policies to specific areas of the domain. Security groups let me manage access and permissions by grouping users, so I could grant an entire department access to resources instead of assigning permissions to each user individually.

## Mastering Account and Password Management

### Diagnosing and fixing disabled accounts

In this step, I fixed disabled user accounts by setting compliant passwords and enabling them, so I could properly manage user access and perform common administrative tasks such as password resets, account unlocks, account disables, and verifying security group memberships.

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_od6dfq5x)

### Password resets, unlocks, and account disables

The accounts were disabled because they were created without passwords, and Active Directory will not enable an account without a password that meets the domain's password policy. I fixed them by running Set-ADAccountPassword to assign a compliant password, Enable-ADAccount to enable each account, and Set-ADUser -ChangePasswordAtLogon $true to require each user to create a new password at their first sign-in.

## Enforcing Security with Group Policy

### Creating and linking the Corp Security Policy GPO

In this step, I set up a Group Policy Object with password complexity and account lockout requirements so that I could enforce consistent security policies across the domain and protect user accounts from weak passwords and repeated failed login attempts.

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_hx4x04t3)

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_4s0odx64)

## Automating Bulk User Provisioning with PowerShell

### Building a CSV-driven provisioning script

In this step, I built a PowerShell automation script that reads new-hire information from a CSV file so that I could provision multiple Active Directory user accounts efficiently, place them in the correct OUs, and assign the appropriate security group memberships with less manual work and fewer errors.

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_mrnv0j9f)

### Automation Artifacts

- [PowerShell Bulk User Provisioning Script](scripts/New-BulkUsers.ps1)
- [Sample Employee CSV Data](data/employees.csv)

### Verifying total domain user count

The count shows 16 because the domain also has built-in accounts such as Administrator, Guest, and krbtgt in addition to the 13 users I created.

## Secret Mission: Configuring DHCP with IP Reservations

![Image](https://nextwork.ai/surprised_yellow_clever_kingfisher/uploads/c535e3a2-10b3-4008-9ff9-0bb284b11497_ttwkvuau)

### Why DHCP authorization in Active Directory matters

In this project extension, I learned that authorization is needed because it prevents unauthorized DHCP servers from issuing IP addresses to domain clients. Active Directory authorization ensures that only approved DHCP servers can provide leases, helping prevent conflicting or incorrect network configurations.

## Reflections and Key Takeaways

### Tools and concepts covered

The key tools I used include Windows Server 2022, Active Directory Users and Computers, Group Policy Management, PowerShell, DNS, and DHCP Server. Key concepts I learned include domain administration, OUs, security groups, Group Policy, account management, bulk user provisioning with PowerShell, DHCP scopes, scope options, reservations, and DHCP authorization in Active Directory.

### Time and challenges

This project took me approximately 3 hours to complete. The most challenging parts were adapting the networking configuration to my AWS environment and troubleshooting the PowerShell bulk-user provisioning script. The users were created successfully, but security group assignment initially failed because the script referenced department group names differently from their Active Directory SamAccountName values. I isolated the group lookup issue, corrected the group identifiers used by Add-ADGroupMember, removed the test users, and reran the script successfully.

I did this project to learn how to build and administer a Windows Active Directory environment, including users, groups, Group Policy, DNS, DHCP, and PowerShell automation. The project gave me hands-on experience with common system administration tasks such as managing user access, enforcing security policies, configuring network services, automating account provisioning, and troubleshooting configuration issues.

---

*Built with [NextWork](https://nextwork.ai) - [View this project](https://nextwork.ai/projects/c535e3a2-10b3-4008-9ff9-0bb284b11497)*

# vultr

## Workflow
```mermaid
graph LR
  A(Write) --> B(Plan)
  B --> C(Apply)
```

- **Write**: Author infrastructure as code
- **Plan**: Preview changes before applying
- **Apply**: Provision reproducible infrastructure

## Usage
### Initialize
```bash
tofu init
```
- OpenTofu needs to create a lock file (.terraform.lock.hcl) to record the provider selections
- **Necessary**, if you are doing this for the first time

### Validate
```bash
tofu validate
```
- To check whether the conf is valid

### Format
```bash
tofu fmt
```
- Re-format config in a standard style

### Plan
```bash
tofu plan -var-file .tfvars
```

### Apply
```bash
tofu apply -var-file .tfvars
```

### Destroy
```bash
tofu apply -destroy -var-file .tfvars
```


## Resources
- [Terraform Registry](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/instance#import)
- [Vultr API](https://www.vultr.com/api/)
- [The Core OpenTofu Worflow](https://opentofu.org/docs/intro/core-workflow)

## Getting Content for Files

---

### Get Regions
```sh
curl "https://api.vultr.com/v2/regions" -X GET \
    - H "Authorization: Bearer ${VULTR_API_KEY}"
    
# For a Pretty View, tack on a `| jq ` to the end
```

<details>
<Summary> Output</Summary>
```txt
{
  "regions": [
    {
      "id": "ams",
      "city": "Amsterdam",
      "country": "NL",
      "continent": "Europe",
      "options": [
        "ddos_protection",
        "block_storage_storage_opt",
        "block_storage_high_perf",
        "load_balancers",
        "kubernetes"
      ]
    },
    ...
    ],
    ....
}
```
</details>

---

### List available plans in regions
```sh
curl "https://api.vultr.com/v2/regions/<region-id>/availability" -X GET \
    - H "Authorization: Bearer ${VULTR_API_KEY}"
    
# For a Pretty View, tack on a `| jq ` to the end
```

<details>
<Summary> Output</Summary>
```txt
{
  "available_plans": [
    "vbm-4c-32gb",
    "vbm-6c-32gb",
    "vc2-1c-1gb",
    "vc2-1c-2gb",
    "vc2-2c-2gb",
    "vc2-2c-4gb",
    "vc2-4c-8gb",
    ...
    ]
}
```
</details>

---

### List OS
```sh
curl "https://api.vultr.com/v2/os" -X GET \
    - H "Authorization: Bearer ${VULTR_API_KEY}"
    
# For a Pretty View, tack on a `| jq ` to the end
```

<details>
<Summary> Output</Summary>
```txt
{
  "os": [
    {
      "id": 124,
      "name": "Windows 2012 R2 Standard x64",
      "arch": "x64",
      "family": "windows"
    },
    {
      "id": 159,
      "name": "Custom",
      "arch": "x64",
      "family": "iso"
    },
    {
      "id": 164,
      "name": "Snapshot",
      "arch": "x64",
      "family": "snapshot"
    },
    {
      "id": 167,
      "name": "CentOS 7 x64",
      "arch": "x64",
      "family": "centos"
    },
	...
	]...
}
```
</details>

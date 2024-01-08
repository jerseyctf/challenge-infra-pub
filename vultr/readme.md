# vultr

## Usage
- Apply config

## Resources
- [Terraform Registry](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/instance#import)
- [Vultr API](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/instance#import)

## Getting Content for Files

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

docker_registry_2 Cookbook
==========================
Chef cookbook for docker registry v2 configuration and install.

e.g.
This cookbook makes your favorite breakfast sandwich.

DEVELOPMENT
-----------

You can test cookbook via kitchen.

`kitchen converge` - for create VM and execute cookbook recipes.
`kitchen login` - for login into provisioned VM.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - docker_registry_2 needs toaster to brown your bagel.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### docker_registry_2::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['docker_registry_2']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### docker_registry_2::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `docker_registry_2` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[docker_registry_2]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors

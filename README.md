https://coreos.com/os/docs/latest/cloud-config.html

# User Accounts BOSH Release

This is a [BOSH](https://bosh.io) release for managing user accounts and SSH keys.

## Usage

To use this bosh release, first upload it to your bosh:

``` shell
bosh target BOSH_HOST
git clone https://github.com/pblittle/user-accounts-boshrelease.git
cd user-boshrelease
bosh upload release ./releases/user-accounts/user-accounts-1.yml
```

Add the release to your BOSH deployment manifest:

``` yaml
---
releases:
  - name: user-accounts
    version: latest
```

Add the job to your BOSH deployment manifest:

``` yaml
---
jobs:
  - name: user-accounts
    templates:
      - name: user-accounts
        release: useradd
```

Add the properties to your BOSH deployment manifest:

```` yaml
properties:
  user-accounts:
    useradd:
      - username: nessus
        groups: nessus
```

## Contributing

1. Fork it
2. Checkout the develop branch (`git checkout -b develop`)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

## License

This application is distributed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).

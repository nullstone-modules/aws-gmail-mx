# block-aws-gmail-mx

Nullstone Block standing up gmail forwarding from AWS Route53

## Inputs

- `owner_id: string` - Stack Owner ID
- `stack_name: string` - Stack Name
- `block_name: string` - Block Name
- `parent_blocks: {domain: string}` - Parent Blocks
- `env: string` - Environment Name
- `backend_conn_str: string` - Connection string for postgres backend

## Outputs


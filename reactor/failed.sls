{%- if data.get('fun') in ('state.single', 'state.top',
			   'state.sls', 'state.apply', 'state.highstate') -%}
  {%- if data.get('retcode', 0) != 0 -%}
    {%- set id_ = data.get('id') -%}
    {%- set jid = data.get('jid') -%}
    {%- set msg = 'One or more states failed for minion `' + id_ +'` ' -%}
    {%- set msg = msg + '(jid: `' + jid + '`)\n```\n' -%}
    {%- set msg = msg + salt['out.string_format']({id_: data.get('return')}, data.get('out')) -%}
    {%- if not msg.endswith('\n') -%}
       {%- set msg = msg + '\n' -%}
    {%- endif -%}
    {%- set msg = msg + '```' -%}

notify_failure:
  runner.salt.cmd:
    - args:
      - fun: slack.post_message
      - channel: saltstack
      - from_name: saltstack
      - api_key: 'xoxp-13150991298-291708908789-404793747813-e70560692cb7531cd8ca24777296e4d6'
      - message: |
          {{ msg | indent(10) }}
  {%- endif -%}
{%- endif -%}
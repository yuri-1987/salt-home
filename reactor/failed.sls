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
      - message: |
          {{ msg | indent(10) }}
  {%- endif -%}
{%- endif -%}
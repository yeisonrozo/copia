#!/usr/bin/ruby
# encoding: utf-8

require_relative '../../lib/tool'

=begin
 Demo script to run on localhost
=end

check :exist_username do

  desc "Checking user <"+get(:username)+">"
  goto :localhost, :execute => "id #{get(:username)}| wc -l"
  expect result.equal?(1)

end

start do
  show
  export
end

=begin
---
:global:
  :host1_username: root
:cases:
- :tt_members: Student1name
  :tt_emails: student1@email.com
  :host1_ip: 127.0.0.1
  :host1_password: toor
  :username: root
- :tt_members: Student2name
  :tt_emails: student2@email.com
  :host1_ip: 127.0.0.1
  :host1_password: toor
  :username: darth-maul
=end
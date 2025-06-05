local function insert(target, values)
  for _, value in ipairs(values) do
      table.insert(target, value)
  end
end

local stubs = { "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib" }

insert(stubs, { "apache", "bcmath", "bz2", "calendar" })
insert(stubs, { "com_dotnet", "Core", "ctype", "curl" })
insert(stubs, { "date", "dba", "dom", "enchant", "exif", "FFI" })
insert(stubs, { "gmp", "hash", "iconv", "imap", "intl", "json" })
insert(stubs, { "ldap", "libxml", "mbstring", "meta", "mysqli", "oci8" })
insert(stubs, { "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm" })
insert(stubs, { "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix" })
insert(stubs, { "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML" })
insert(stubs, { "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3" })
insert(stubs, { "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm" })
insert(stubs, { "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc" })
insert(stubs, { "wordpress" })

return {
  settings = {
    intelephense = {
      stubs = stubs,
      files = {
        maxSize = 5000000,
      },
    },
  },
}

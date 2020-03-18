@load ../__load__.zeek

module FileExtraction;

const linux_types: set[string] = {
    "application/x-object",
    "application/x-executable",
    "application/x-sharedlib",
    "application/x-coredump"
};

hook FileExtraction::extract(f: fa_file, meta: fa_metadata) &priority=5
{
  if ( meta$mime_type in linux_types )
    break;
}

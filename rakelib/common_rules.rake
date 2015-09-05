rule '.o' => [ '.c' ] do |t|
  begin
    print((t.source + ' ').cyan)
    command = "#{CC} -o #{t.name} #{cflags} #{INCLUDES.join(' ')} -c #{t.source}"
    sh command
  rescue
    puts "Error compiling #{t.source}. Full command line was: #{command}"
    raise
  end
end

rule '.o' => [ '.rs' ] do |t|
  begin
    print((t.source + ' ').cyan)
    command = "#{RUSTC} #{RUSTCFLAGS} --crate-type lib -o #{t.name} --emit obj #{t.source}"
    sh command
  rescue
    puts "Error compiling #{t.source}. Full command line was: #{command}"
    raise
  end
end

rule '.o' => [ '.S' ] do |t|
  begin
    print((t.source + ' ').cyan)
    command = "#{CC} -o #{t.name} #{CFLAGS} #{INCLUDES.join(' ')} -c #{t.source}"
    sh command
  rescue
    puts "Error compiling #{t.source}. Full command line was: #{command}"
    raise
  end
end

rule '.o' => [ '.asm' ] do |t|
  begin
    print((t.source + ' ').cyan)
    command = "#{NASM} -o #{t.name} -f elf #{t.source}"
    sh command
  rescue
    puts "Error compiling #{t.source}. Full command line was: #{command}"
    raise
  end
end

def cflags
  flags = CFLAGS.join(' ') if CFLAGS.respond_to?(:join)
  flags ||= CFLAGS
end

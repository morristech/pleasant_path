class String

  # Constructs a Pathname from the String.
  #
  # @example
  #   "path/to/file".to_pathname  # == Pathname.new("path/to/file")
  #
  # @return [Pathname]
  def to_pathname
    Pathname.new(self)
  end

  # Alias of {String#to_pathname}.
  #
  # @return [Pathname]
  alias :path :to_pathname

  # Constructs a Pathname from the String, and appends +child+ to the
  # Pathname.
  #
  # @example
  #   "path/to" / "file"  # == Pathname.new("path/to/file")
  #
  # @param child [String]
  # @return [Pathname]
  def /(child)
    self.path / child
  end

  # Writes the String to the specified +file+, overwriting the file if
  # it exists.  Creates the file if it does not exist, including
  # any necessary parent directories.  Returns the String.
  #
  # @see Pathname#write_text
  #
  # @example
  #   "hello world".write_to_file("out.txt")  # == "hello world"
  #   File.read("out.txt")                    # == "hello world"
  #
  # @param file [String, Pathname]
  # @return [self]
  def write_to_file(file)
    file.to_pathname.write_text(self)
    self
  end

  # Appends the String to the specified +file+.  Creates the file if it
  # does not exist, including any necessary parent directories.  Returns
  # the String.
  #
  # @see Pathname#append_text
  #
  # @example
  #   "hello".append_to_file("out.txt")   # == "hello"
  #   File.read("out.txt")                # == "hello"
  #   " world".append_to_file("out.txt")  # == " world"
  #   File.read("out.txt")                # == "hello world"
  #
  # @param file [String, Pathname]
  # @return [self]
  def append_to_file(file)
    file.to_pathname.append_text(self)
    self
  end

end

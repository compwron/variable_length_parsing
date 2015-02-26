class One
	KNOWN_TAGS = {
		"FOO" => :descriptive_foo_name,
		"BAR" => :descriptive_bar_name
	}

	def parse1(stream)
		hash = {}
		while tag = stream.read(2)
			length = stream.read(3).to_i
			if KNOWN_TAGS.has_key?(tag)
				hash[KNOWN_TAGS[tag]] = stream.read(length)
			else
				hash[tag] = stream.read(length)
			end
		end
		hash
	end
end
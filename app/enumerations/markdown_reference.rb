class MarkdownReference < EnumerateIt::Base
  associate_values(
    strong_and_emphasize: 1,
    links_and_email:      2,
    images:               3,
    headers:              4,
    lists:                5,
    blockquotes:          6,
    inline_code:          7,
    block_code:           8,
    horizontal_rules:     9,
    hard_line_breaks:     10,
    footnotes:            11,
    strikethrough:        12,
    fenced_code_blocks:   13,
    tables:               14,
    anchor:               15
  )

  def self.to_a
    super.sort_by(&:second)
  end

  def self.all
    keys.map(&:to_s)
  end
end

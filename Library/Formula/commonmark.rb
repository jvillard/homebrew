class Commonmark < Formula
  desc "Strongly specified, highly compatible implementation of Markdown"
  homepage "http://commonmark.org"
  url "https://github.com/jgm/cmark/archive/0.25.0.tar.gz"
  sha256 "73b36b24229fcd13cf63d6a32ec8f347d313e1029d33eff72d7414f24602ceeb"

  bottle do
    cellar :any
    sha256 "6615a070dbfd8291dd878ea633350bd53039f7861bd2f429e28972a89104ffeb" => :el_capitan
    sha256 "ed171cd2431324f3d58a8ea7199510ec03489223533abbf8debdb80f9c21620d" => :yosemite
    sha256 "d271dd8964a2b7cbbdcc129e7268a22fc5152fe5209ddbb8f556bdc08d137c87" => :mavericks
  end

  depends_on "cmake" => :build
  depends_on :python3 => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    test_input = "*hello, world*\n"
    expected_output = "<p><em>hello, world</em></p>\n"
    test_output = `/bin/echo -n "#{test_input}" | #{bin}/cmark`
    assert_equal expected_output, test_output
  end
end

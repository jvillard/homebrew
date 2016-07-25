class Commonmark < Formula
  desc "Strongly specified, highly compatible implementation of Markdown"
  homepage "http://commonmark.org"
  url "https://github.com/jgm/cmark/archive/0.25.2.tar.gz"
  sha256 "530ae56d81a370ce29ed77fd3a34628c94277320f23657f5efb402283716f29b"

  bottle do
    cellar :any
    sha256 "c2893dcdee74722df71f79f507b83e247894d8a2b2563dd6988461c68beb6a7b" => :el_capitan
    sha256 "e6d49d7007c548b6174882a2756eef63676baa4e1bcbfecf22ddfaba95bd66d5" => :yosemite
    sha256 "6b762bda0196ebb620089e6cba94b7dd3abb252cf2f9d6ab99d3af7824733a2b" => :mavericks
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

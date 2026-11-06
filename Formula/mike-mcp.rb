class MikeMcp < Formula
  desc "MCP stdio bridge for Mike capture inspection"
  homepage "https://github.com/temet-ai/mike"
  license "MIT"
  version "0.1.0-alpha.3"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/temet-ai/mike/releases/download/v0.1.0-alpha.3/mike-mcp-v0.1.0-alpha.3-aarch64-apple-darwin.tar.gz"
    sha256 "5540f8787a754deb9577b1c3dabaf1468afad9ccb4a303b12bedddf943adcca9"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/temet-ai/mike/releases/download/v0.1.0-alpha.3/mike-mcp-v0.1.0-alpha.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e23932d3a044f862157a47dfcc23945bd413065c53610e42d71364c46445ef02"
  end

  def install
    bin.install "mike-mcp"
    pkgshare.install "LICENSE", "NOTICE.json"
  end

  def caveats
    <<~EOS
      No service, database, shell profile or client registration is changed.
      Install both mike and mike-mcp formulae for the complete native pair.
    EOS
  end

  test do
    assert_match "mike-mcp 0.1.0-alpha.3", shell_output("#{bin}/mike-mcp --version")
    system "#{bin}/mike-mcp", "list-tools", "--json"
  end
end

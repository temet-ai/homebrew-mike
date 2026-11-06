class Mike < Formula
  desc "Local Claude API reverse proxy and capture browser"
  homepage "https://github.com/temet-ai/mike"
  license "MIT"
  version "0.1.0-alpha.3"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/temet-ai/mike/releases/download/v0.1.0-alpha.3/mike-v0.1.0-alpha.3-aarch64-apple-darwin.tar.gz"
    sha256 "42dea9385f1ce417cc0a55bd2972cdd9590f88f35f46838f01b878bc870a5ba3"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/temet-ai/mike/releases/download/v0.1.0-alpha.3/mike-v0.1.0-alpha.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b5469de94e21074233da760c39a3a8162677fc3480972ea39a3fcc830f4e4a75"
  end

  def install
    bin.install "mike"
    pkgshare.install "LICENSE", "NOTICE.json"
    libexec.install "mike-maintenance", "mike-maintenance.pyz"
    (share/"mike").install "share/mike/mods" if File.directory?("share/mike/mods")
  end

  def caveats
    <<~EOS
      No service, database, shell profile or client registration is changed.
      Install both mike and mike-mcp formulae for the complete native pair.
      The optional libexec/mike-maintenance kit needs Bash and Python 3.11+.
      It manages separate archive-owned prefixes; use brew to update/remove this formula.
    EOS
  end

  test do
    assert_match "mike 0.1.0-alpha.3", shell_output("#{bin}/mike --version")
    system "#{bin}/mike", "--help"
  end
end

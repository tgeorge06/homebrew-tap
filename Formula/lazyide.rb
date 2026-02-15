class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.2.5/lazyide-macos-aarch64.tar.gz"
      sha256 "3ff5e8410d0ce823599fdd2b4d8dd732a49473589662975877e2cd09ba0bdd50"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.2.5/lazyide-macos-x86_64.tar.gz"
      sha256 "822584fce36fa78c3db47b2a9e71665ca0de392f5aab0c83d1ec83bfa5600196"
    end
  end

  def install
    bin.install "lazyide"
  end

  def caveats
    <<~EOS
      Optional tools for full functionality:
        brew install ripgrep        # project-wide search (Ctrl+Shift+F)
        rustup component add rust-analyzer  # LSP for Rust files

      Run `lazyide --setup` to check and install missing tools.
    EOS
  end

  test do
    assert_match "Usage: lazyide", shell_output("#{bin}/lazyide --help")
  end
end

class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.5/lazyide-macos-aarch64.tar.gz"
      sha256 "5e5033e44cdd282c92743de95caacec272f999f950acd0d5327b96723b8fbe86"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.5/lazyide-macos-x86_64.tar.gz"
      sha256 "a3469485e903e5db4234e02a3a1a30e38402d5c4fc19baf2c0d97849c250b8f5"
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

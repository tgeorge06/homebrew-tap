class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.6/lazyide-macos-aarch64.tar.gz"
      sha256 "dfd7bb3bc0ed5db2e7387038305517fc9ef79d4637c23b4d1e109546caa03d00"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.6/lazyide-macos-x86_64.tar.gz"
      sha256 "70c5930ec3b979fc6c6a3ffdc82f7d5e6e591874954b14e76333e835ed212cc9"
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

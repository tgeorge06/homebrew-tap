class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.0/lazyide-macos-aarch64.tar.gz"
      sha256 "49dc7a0f5db8c7163d13b50a2866ac49ad1abd75640c7999f0a304fe5c6acad8"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.0/lazyide-macos-x86_64.tar.gz"
      sha256 "cb1d4c26d9f3f0331654573fa77ed08127a2fd98cc9af78bca8d95eb6a9ef003"
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

class Lab < Formula
  desc "Lab wraps Git or Hub, making it simple to clone, fork, and interact with repositories on GitLab"
  homepage "https://zaquestion.github.io/lab"
  url "https://github.com/zaquestion/lab/archive/v0.15.2.tar.gz"
  sha256 "fa4db6111cffcc8da4ac97f85c5784093276fa25cadc438a4f09070b636b4c8e"
  depends_on "go" => :build

  def install
    system "make", "install"
    bin.install "lab"
  end

  test do
    system "git", "init"
    %w[haunted house].each { |f| touch testpath/f }
    system "git", "add", "haunted", "house"
    system "git", "commit", "-a", "-m", "Initial Commit"
#    system "git", "config", "--local", "--add", "gitlab.host", "http://example.com"
#    system "git", "config", "--local", "--add", "gitlab.user", "test"
#    system "git", "config", "--local", "--add", "gitlab.token", "test"
    assert_equal "haunted\nhouse", shell_output("#{bin}/lab ls-files").strip
  end
end

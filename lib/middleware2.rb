
class Middleware2

  def initialize(app)
    @app = app
  end

  def call(env)
    puts "calling middleware"
    if env['PATH_INFO'] =~ /\A\/attachment\/([a-f0-9\-]{36})\/(.*)/
      if false#attachment = Nifty::Attachments::Attachment.find_by_token($1)
        [200, {
          'Content-Length' => attachment.data.bytesize.to_s,
          'Content-Type' => attachment.file_type,
          'Cache-Control' => "public, maxage=#{1.year.to_i}",
          'Content-Disposition' => "inline; filename=\"#{attachment.file_name}\""
          },
        [attachment.data]]
      else
        [404, {}, ["Attachment not found"]]
      end
    else
      @app.call(env)
    end
  end

end

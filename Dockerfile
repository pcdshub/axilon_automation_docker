FROM perl:5.30

LABEL maintainer="K Lauer <klauer@slac.stanford.edu>"
USER root

WORKDIR /axilon
# RUN git clone https://github.com/slaclab/axilon_mirror_automation.git device-uut
COPY axilon_mirror_automation/ /axilon/device-uut/

RUN cpan -T -f -i IPC::Run
RUN cpan -T -f -i JSON
RUN cpan -T -f -i Moose
RUN cpan -T -f -i MooseX::Params::Validate
RUN cpan -T -f -i namespace::autoclean
RUN cpan -T -f -i Term::ProgressBar
RUN cpan -T -f -i Class::MethodMaker
RUN cpan -T -f -i Module::Runtime

ENV PERL5LIB /axilon/device-uut/lib:perl5/lib/perl5/:perl5/lib/perl5/x86_64-linux-thread-multi

RUN perldoc device-uut/lib/Device/UUT.pm
ENTRYPOINT ["perl", "/axilon/device-uut/bin/uut-pv" ]

class UsStateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, (options[:message] || "is invalid")) unless UsStateValidator.valid_state?(value)
  end

  def self.valid_state?(value)
    US_STATE_ABBREV.include?(value)
  end

  # NB: Includes DC
  US_STATE_ABBREV = %w[
    AK
    AL
    AR
    AZ
    CA
    CO
    CT
    DC
    DE
    FL
    GA
    HI
    IA
    ID
    IL
    IN
    KS
    KY
    LA
    MA
    MD
    ME
    MI
    MN
    MO
    MS
    MT
    NC
    ND
    NE
    NH
    NJ
    NM
    NV
    NY
    OH
    OK
    OR
    PA
    RI
    SC
    SD
    TN
    TX
    UT
    VA
    VT
    WA
    WI
    WV
    WY
  ].freeze
end
